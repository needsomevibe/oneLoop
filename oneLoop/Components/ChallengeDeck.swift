//
//  ChallengeDeck.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct ChallengeDeck: View {
    let challenges: [Challenge]

    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGSize = .zero
    @State private var exitOffsetX: CGFloat = 0
    @State private var isAnimatingOut = false

    private let swipeThreshold: CGFloat = 100

    var body: some View {
        ZStack {
            if let next = nextChallenge {
                // Back (next) card for deck effect
                ChallengeCard(
                    text: next.text,
                    showsMenu: false,
                    appearance: appearance(for: nextIndex)
                )
                .scaleEffect(backScale)
                .opacity(backOpacity)
                .offset(x: backOffsetX)
            }

            if let current = currentChallenge {
                ChallengeCard(
                    text: current.text,
                    showsMenu: true,
                    appearance: appearance(for: currentIndex)
                )
                .offset(x: dragOffset.width + exitOffsetX)
                .rotationEffect(.degrees(Double((dragOffset.width + exitOffsetX) / 20)))
                .shadow(color: Color.black.opacity(0.1),
                        radius: min(abs(dragOffset.width) / 12, 10),
                        x: 0, y: 6)
                .gesture(dragGesture)
                .animation(.interactiveSpring(), value: dragOffset)
                .animation(.spring(response: 0.35, dampingFraction: 0.85), value: exitOffsetX)
                .allowsHitTesting(!isAnimatingOut)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }

    // MARK: - Computed helpers
    private var currentChallenge: Challenge? {
        guard !challenges.isEmpty else { return nil }
        return challenges[currentIndex]
    }

    private var nextIndex: Int {
        guard challenges.count > 1 else { return currentIndex }
        return (currentIndex + 1) % challenges.count
    }

    private var nextChallenge: Challenge? {
        guard challenges.count > 1 else { return nil }
        return challenges[nextIndex]
    }

    private func appearance(for index: Int) -> ChallengeCard.Appearance {
        index.isMultiple(of: 2) ? .light : .accent
    }

    private var backScale: CGFloat {
        // Slightly grow as you drag right
        let progress = min(max(dragOffset.width / 140, 0), 1)
        return 0.97 + 0.03 * progress
    }

    private var backOpacity: Double {
        let progress = min(max(dragOffset.width / 140, 0), 1)
        return 0.8 + 0.2 * progress
    }

    private var backOffsetX: CGFloat {
        // Subtle parallax
        min(max(dragOffset.width / 10, 0), 12)
    }

    // MARK: - Gesture
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 5, coordinateSpace: .local)
            .updating($dragOffset) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                let translationX = value.translation.width
                if translationX > swipeThreshold {
                    advanceToNext()
                } else {
                    // Snap back
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                        exitOffsetX = 0
                    }
                }
            }
    }

    // MARK: - Advance
    private func advanceToNext() {
        guard challenges.count > 1, !isAnimatingOut else { return }
        isAnimatingOut = true

        // Haptic feedback
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        // Fly out to the right
        withAnimation(.spring(response: 0.28, dampingFraction: 0.85)) {
            exitOffsetX = UIScreen.main.bounds.width
        }

        // After the fly-out completes, swap index and bring next in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
            currentIndex = (currentIndex + 1) % challenges.count
            // Prepare new front card to come from slight left
            exitOffsetX = -40

            withAnimation(.spring(response: 0.32, dampingFraction: 0.9)) {
                exitOffsetX = 0
            }

            // Small delay to re-enable interaction
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
                isAnimatingOut = false
            }
        }
    }
}
