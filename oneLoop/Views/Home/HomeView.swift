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

    private let dailyChallenges: [Challenge] = [
            Challenge(text: "Ask for the time or directions to someone you don’t know, even if you know it already", xp: 10),
            Challenge(text: "Compliment a stranger genuinely", xp: 15),
            Challenge(text: "Say hi to three people you don’t know", xp: 20),
            Challenge(text: "Sing it out loud", xp: 20)
        ]

    private let weeklyChallenges: [Challenge] = [
            Challenge(text: "Talk to 10 strangers during this week", xp: 50),
            Challenge(text: "Join a social event or club", xp: 70),
            Challenge(text: "Start a conversation with a coworker/classmate", xp: 40),
            Challenge(text: "Invite someone new for coffee", xp: 60)
        ]
    
    var body: some View {
        VStack(spacing: 0) {
            header()
                .padding(.top, 8)
            Spacer()
                .frame(height: 40)

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    
                    
                    Spacer(minLength: 80)

                                    // Stacked Daily Challenges
                                        StackedChallengesView(challenges: dailyChallenges)
                                            .padding(.top, 8)
                    ButtonComponent(text: .constant("Random"))
                    //Spacer(minLength: 120)
                    Text("Level 1")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    
                    
                    

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
