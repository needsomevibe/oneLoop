//
//  StackedChallengesView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 13/10/25.
//

import SwiftUI

struct StackedChallengesView: View {
    let challenges: [Challenge]
    @State private var currentIndex = 0
    private let maxVisibleCards = 3
    
    var body: some View {
        ZStack{
            ForEach(currentIndex..<min(currentIndex + maxVisibleCards, challenges.count), id: \.self) { index in
                let challenge = challenges[index]
                let appearance: ChallengeCard.Appearance = index.isMultiple(of: 2) ? .light : .accent
                
                ChallengeCard(
                    text: challenge.text,
                    showsMenu: index == currentIndex,
                    onSwipeRight: { goNext() },
                    onSwipeLeft: { goPrevious() },
                    appearance: appearance
                )
                .padding(.horizontal, 20)
                .scaleEffect(1 - CGFloat(index - currentIndex) * 0.05) // smaller for cards behind
                .offset(x: CGFloat(index - currentIndex) * 14)
                .opacity(index - currentIndex < maxVisibleCards ? 1 : 0)
                .zIndex(Double(challenges.count - index))
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: currentIndex)
            }
        }
    }
    
    private func goNext() {
        if currentIndex < challenges.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }
    
    private func goPrevious() {
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            currentIndex = challenges.count - 1
        }
    }
}

/*#Preview {
    StackedChallengesView(challenges: [
        Challenge(text: "Ask for the time or directions to someone you don’t know, even if you know it already", xp: 10),
        Challenge(text: "Talk to 10 strangers during this week", xp: 50),
        Challenge(text: "Smile at three people today", xp: 5)
    ])
}*/
