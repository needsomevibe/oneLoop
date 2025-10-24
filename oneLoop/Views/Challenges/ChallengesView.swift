//
//  ChallengesView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 15/10/25.
//


import SwiftUI

struct ChallengesView: View {
    let level: Level // Recibe el nivel completo

    var body: some View {
        VStack(spacing: 16) {
            // App header
            /*header()
                .padding(.top, 2)*/

            // Screen title
            ScreenTitle(title: level.title)
                .foregroundStyle(Color.blueDemon)
                

            // Content
            ScrollView {
                VStack(spacing: 32) {
                    ForEach(level.challenges, id: \.title) { challenge in
                        ChallengeCardd(challenge: challenge)
                    }
                }
                .padding(.top, 8)
            }
        }
        .background(Color(.backBlue))
    }
}

#Preview {
    ChallengesView(level: Level(
        title: "Level 1",
        challenges: [
            ChallengeDetail(
                title: "Challenge 1",
                subtitle: "Preview Example",
                objective: "Just a sample challenge.",
                steps: ["Step 1", "Step 2"]
            )
        ]
    ))
}

