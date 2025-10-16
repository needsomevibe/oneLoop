//
//  CompleteChallengeCard.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 16/10/25.
//

import SwiftUI

struct CompleteChallengeCard: View {
    let title: String   //We declare with let in order to use it as parameters
    let subtitle: String
    let objective: String
    let step1: String
    let step2: String
    let step3: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue)
                .frame(width: 350, height: 480)
                .offset(x: 7,y: 8)
            // Foreground white card
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 3)
                .frame(width: 350, height: 480)
                .overlay(
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                            Text("Objective:")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top, 12)
                            Text(objective)
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.7))
                            Text("Steps:")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top, 12)

                            // Steps text
                            Text("1. \(step1)")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.7))
                            Text("2. \(step2)")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.7))
                            Text("3. \(step3)")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.7))
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
        title: "Challenge 1",
        subtitle: "Ask for someone to help you",
        objective: "Try to findo someone sjsjsjsjs",
        step1: "Find someone",
        step2: "Call it",
        step3: "Introduce Yourself"
    )
}

