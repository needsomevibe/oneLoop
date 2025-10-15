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
                        title: "Challenge 1",
                        subtitle: "Asking for Information"
                    )
                    ChallengeCardd(
                        title: "Challenge 2",
                        subtitle: "Making Requests"
                    )
                    ChallengeCardd(
                        title: "Challenge 3",
                        subtitle: "Making Requests"
                    )
                    ChallengeCardd(
                        title: "Challenge 4",
                        subtitle: "Making Requests"
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
