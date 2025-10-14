//
//  ChallengeCard.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct ChallengeCard: View {
    enum Appearance {
        case light
        case accent
    }

    let text: String
    //let xp: Int
    var showsMenu: Bool = false
    var onMenuTap: (() -> Void)? = nil
    var onSwipeRight: (() -> Void)? = nil
    var onSwipeLeft: (() -> Void)? = nil
    var onDone: (() -> Void)? = nil
    var appearance: Appearance = .light
    
    @State private var offset: CGSize = .zero
    @GestureState private var isDragging = false
    @State private var isExpanded: Bool = false
    @State private var doneButtonText: String = "Done!"

    private var backgroundColor: Color {
        switch appearance {
        case .light:
            return Color(.systemBackground)
        case .accent:
            return Color.accentColor
        }
    }

    private var borderColor: Color {
        switch appearance {
        case .light:
            return Color(.quaternaryLabel)
        case .accent:
            // Subtle border for accent; you can tweak or remove
            return Color.accentColor.opacity(0.6)
        }
    }

    private var foregroundColor: Color {
        switch appearance {
        case .light:
            return .primary
        case .accent:
            return .white
        }
    }

    private var secondaryForegroundColor: Color {
        switch appearance {
        case .light:
            return .secondary
        case .accent:
            return Color.white.opacity(0.9)
        }
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Main content centered
            VStack(alignment: .center, spacing: 16) {
                Text(text)
                    .foregroundStyle(foregroundColor)
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)

                HStack {
                    Spacer()
                    //Text("+\(xp) XP")
                        .foregroundStyle(secondaryForegroundColor)
                        .font(.system(size: 22, weight: .heavy))
                }

                // Expandable area with the custom button
                if isExpanded {
                    // Separate the button slightly from the text
                    VStack(spacing: 12) {
                        ButtonComponent(text: $doneButtonText)
                            .onChange(of: doneButtonText) { _, newValue in
                                // Your ButtonComponent sets text = "Hello Learners!"
                                // We can treat any tap as completion and call onDone.
                                onDone?()
                            }
                    }
                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .bottom)),
                                            removal: .opacity.combined(with: .move(edge: .top))))
                }
            }
            .frame(maxWidth: .infinity, minHeight: isExpanded ? 240 : 180) // Taller when expanded
            .padding(16)

            // Menu button overlayed at top-right
            if showsMenu {
                Button {
                    onMenuTap?()
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundStyle(secondaryForegroundColor)
                        .padding(10)
                }
                .buttonStyle(.plain)
                .padding(.top, 6)
                .padding(.trailing, 6)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(borderColor, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(appearance == .light ? 0.04 : 0.08), radius: 8, x: 0, y: 4)
        .rotationEffect(.degrees(Double(offset.width / 15))) // tilt effect
        .offset(x: offset.width, y: offset.height)
        .contentShape(RoundedRectangle(cornerRadius: 14, style: .continuous)) // make entire card tappable
        .onTapGesture {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                isExpanded.toggle()
            }
        }
        .gesture(
            DragGesture()
                .updating($isDragging) { _, state, _ in
                    state = true
                }
                .onChanged { value in
                    offset = value.translation
                }
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
        .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isExpanded)
    }
}

#Preview {
    VStack(spacing: 24) {
        ChallengeCard(
            text: "Ask for the time or directions to someone you don’t know, even if you know it already",
            appearance: .light
            //xp: 10
        )
        ChallengeCard(
            text: "Talk to 10 strangers during this week",
            //xp: 50,
            showsMenu: true,
            appearance: .accent
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
