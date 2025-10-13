//
//  StackedChallengesView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 13/10/25.
//

import SwiftUI

struct StackedChallengesView: View {
    let challenges: [(text: String, xp: Int)]
    @State private var currentIndex = 0
    private let maxVisibleCards = 3
    
    var body: some View {
        ZStack{
            ForEach(currentIndex..<min(currentIndex + maxVisibleCards, challenges.count), id: \.self){
                index in let challenge = challenges[index]
                
                ChallengeCard(text: challenge.text, xp: challenge.xp, showsMenu: index == currentIndex, onSwipeRight: {goNext()}, onSwipeLeft: {goPrevious()}
                )
                .padding(.horizontal, 20)
                .scaleEffect(1 - CGFloat(index - currentIndex) * 0.05) //smaller for cards behind
                .offset(x: CGFloat(index - currentIndex) * 14)
                .opacity(index - currentIndex < maxVisibleCards ? 1 : 0)
                .zIndex(Double(challenges.count - index))
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: currentIndex)

                
            }
        }
    }
    
    private func goNext(){
        if currentIndex < challenges.count - 1 {
            currentIndex += 1
        } else{
            currentIndex = 0
        }
    }
    
    private func goPrevious(){
        if currentIndex > 0 {
            currentIndex -= 1
        } else{
            currentIndex = challenges.count - 1
        }
    }
}

/*#Preview {
    StackedChallengesView()
}*/
