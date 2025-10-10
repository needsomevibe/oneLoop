//
//  HomeView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var dailySelection: PillToggle.Selection = .left   // Daily / Random
    @State private var weeklySelection: PillToggle.Selection = .left  // Weekly / Monthly

    var body: some View {
        VStack(spacing: 0) {
            header()
                .padding(.top, 8)
            Spacer()
                .frame(height: 40)

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Daily / Random
                    PillToggle(
                        leftTitle: "Daily",
                        rightTitle: "Random",
                        selection: $dailySelection
                    )
                    .padding(.horizontal, 20)

                    ChallengeCard(
                        text: "Ask for the time or directions to someone you don’t know, even if you know it already",
                        xp: 10,
                        showsMenu: false
                    )
                    .padding(.horizontal, 20)

                    // Weekly / Monthly
                    VStack(alignment: .leading, spacing: 12) {
                        PillToggle(
                            leftTitle: "Weekly",
                            rightTitle: "Monthly",
                            selection: $weeklySelection
                        )

                        ChallengeCard(
                            text: "Talk to 10 strangers during this week",
                            xp: 50,
                            showsMenu: true
                        )
                    }
                    .padding(.horizontal, 20)

                    // Streak
                    VStack(spacing: 12) {
                        Text("Don’t Lose Your Streak!")
                            .font(.headline)
                            .foregroundColor(.primary)

                        StreakSection(
                            weekDays: ["SAN","MON","TUE","WED","THU","FRI","SAT"],
                            dates: [15,16,17,18,19,20,21],
                            selectedIndices: [1,2,3,4] // highlight 16–19
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 24)
                }
                .padding(.top, 16)
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    HomeView()
}
