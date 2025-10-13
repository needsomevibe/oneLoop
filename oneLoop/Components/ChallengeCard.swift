//
//  ChallengeCard.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct ChallengeCard: View {
    let text: String
    let xp: Int
    var showsMenu: Bool = false
    var onMenuTap: (() -> Void)? = nil
    var onSwipeRight: (() -> Void)? = nil
    var onSwipeLeft: (() -> Void)? = nil
    
    @State private var offset: CGSize = .zero
    @GestureState private var isDragging = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                Text(text)
                    .foregroundStyle(.primary)
                    .font(.system(size: 17, weight: .semibold))
                    .multilineTextAlignment(.leading)
                Spacer(minLength: 12)
                if showsMenu {
                    Button {
                        onMenuTap?()
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .foregroundStyle(.secondary)
                            .padding(.top, 2)
                    }
                    .buttonStyle(.plain)
                }
            }

            HStack {
                Spacer()
                Text("+\(xp) XP")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 22, weight: .heavy))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color(.quaternaryLabel), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 4)
        .rotationEffect(.degrees(Double(offset.width / 15))) //tilt effect
        .offset(x: offset.width, y: offset.height)
        .gesture(
            DragGesture()
                .updating($isDragging) { _, state, _ in
                    state = true
                }
                .onChanged {value in offset = value.translation }
                .onEnded { value in
                    let horizontalAmount = value.translation.width

                                        withAnimation(.spring()) {
                                            if horizontalAmount > 150 {
                                                // Swipe right → next challenge
                                                offset = CGSize(width: 1000, height: 0)
                                                onSwipeRight?()
                                            } else if horizontalAmount < -150 {
                                                // Swipe left → previous challenge
                                                offset = CGSize(width: -1000, height: 0)
                                                onSwipeLeft?()
                                            } else {
                                                // Not enough → snap back
                                                offset = .zero
                                            }
                                        }
                }
        )
        .animation(.interactiveSpring(), value: offset)
    }
}

#Preview {
    VStack(spacing: 24) {
        ChallengeCard(
            text: "Ask for the time or directions to someone you don’t know, even if you know it already",
            xp: 10
        )
        ChallengeCard(
            text: "Talk to 10 strangers during this week",
            xp: 50,
            showsMenu: true
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
