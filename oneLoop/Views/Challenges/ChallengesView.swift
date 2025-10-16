//
//  ChallengesView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 15/10/25.
//

import SwiftUI

struct ChallengesView: View {
    let title: String

    var body: some View {
        VStack(spacing: 16) {
            // App header (uses the existing `header` view)
            header()
                .padding(.top, 2)

            // Screen title
            ScreenTitle(title: title)

            // Content
            ScrollView {
                VStack(spacing: 32) {
                    ChallengeCardd(
                        challenge: ChallengeDetail(
                            title: "Challenge 1",
                            subtitle: "Asking for Information",
                            objective: "Learn to ask for information clearly and confidently.",
                            steps: [
                                "Use the `.request` modifier to make a request to the API",
                                "Use the `.decode` modifier to decode the response",
                                "Use the `.map` modifier to transform the decoded data"
                            ]
                        )
                    )
                    ChallengeCardd(
                        challenge: ChallengeDetail(
                            title: "Challenge 2",
                            subtitle: "Making Requests",
                            objective: "Practice making simple requests.",
                            steps: [
                                "Use the `.request` modifier to make a request to the API",
                                "Use the `.decode` modifier to decode the response",
                                "Use the `.map` modifier to transform the decoded data"
                            ]
                        )
                    )
                    ChallengeCardd(
                        challenge: ChallengeDetail(
                            title: "Challenge 3",
                            subtitle: "Saying Hello to 5 people",
                            objective: "Improve your ability to talk with people.",
                            steps: [
                                "Find a person",
                                "Say hi!",
                                "Repeat the other 2 steps"
                            ]
                        )
                    )
                    ChallengeCardd(
                        challenge: ChallengeDetail(
                            title: "Challenge 4",
                            subtitle: "Making Requests",
                            objective: "Try a more challenging social interaction.",
                            steps: [
                                "Abduzcan",
                                "Paso 2",
                                "Paso 3"
                            ]
                        )
                    )
                }
                .padding(.top, 8)
            }
        }
        .background(Color(.backBlue))
    }
}

#Preview {
    ChallengesView(title: "Level 1")
}
