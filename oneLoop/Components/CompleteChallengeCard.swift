//
//  CompleteChallengeCard.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 16/10/25.
//

import SwiftUI

struct CompleteChallengeCard: View {
    let challenge: ChallengeDetail

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blueDemon)
                .frame(width: 350, height: 480)
                .offset(x: 7,y: 8)
            // Foreground white card
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 3)
                .frame(width: 350, height: 480)
                .overlay(
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            /*Text(challenge.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)*/
                            Text(challenge.subtitle)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black.opacity(0.7))
                            Text("Objective:")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top, 12)
                            Text(challenge.objective)
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.7))
                            Text("Steps:")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top, 12)

                            // Steps list
                            ForEach(Array(challenge.steps.enumerated()), id: \.offset) { index, step in
                                Text("\(index + 1). \(step)")
                                    .font(.caption2)
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            /*HStack{
                                Text("You have completed this challenge: ")
                                    .font(.caption2)
                                    //.padding(.top, 15)
                                Text("2 times")
                                    .font(.caption2)
                                    .bold()
                                    
                            }
                            .padding(.top, 15)*/
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                )
        }
        
    }
}

#Preview {
    CompleteChallengeCard(
        challenge: ChallengeDetail(
            title: "Challenge 1",
            subtitle: "Ask for someone to help you",
            objective: "Try to find someone who can help you with a simple task.",
            steps: ["Find someone", "Call them", "Introduce yourself"]
        )
    )
}
