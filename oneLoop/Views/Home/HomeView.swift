//
//  HomeView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct HomeView: View {

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
    @EnvironmentObject var progressVM: ChallengeProgressViewModel
    var body: some View {
        VStack (spacing: 42){
            header()
            Spacer()

            NavigationLink {
                ChallengesView(title: "Level 1")
            } label: {
                ButtonComponentStyle(title: "Level 1", cornerRadius: 12)
            }

            NavigationLink {
                ChallengesView(title: "Level 2")
            } label: {
                ButtonComponentStyle(title: "Level 2", cornerRadius: 16)
            }

            NavigationLink {
                ChallengesView(title: "Level 3")
            } label: {
                ButtonComponentStyle(title: "Level 3", cornerRadius: 20)
            }

            NavigationLink {
                ChallengesView(title: "Level 4")
            } label: {
                ButtonComponentStyle(title: "Level 4") // default 14
            }
            
            /*VStack{
                Text("15/20")
                    .font(.callout.bold())
                    .foregroundColor(.black)
                    .padding(.top, 10)
                Text("Challenges Completed")
                    .font(.caption2)
            }*/
            VStack {
                Text("\(progressVM.completedChallenges)/\(progressVM.totalChallenges)")
                    .font(.callout.bold())
                    .foregroundColor(.black)
                    .padding(.top, 10)
                Text("Challenges Completed")
                    .font(.caption2)
            }
            

            Spacer()
        }
        .background(Color(.backBlue))
    }
}

private struct ButtonComponentStyle: View {
    let title: String
    let cornerRadius: CGFloat
    let tint: Color

    init(title: String, cornerRadius: CGFloat = 14, tint: Color = .blue) {
        self.title = title
        self.cornerRadius = cornerRadius
        self.tint = tint
    }

    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .semibold))
            .frame(maxWidth: .infinity, minHeight: 56)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(tint)
                    .frame(width: 350, height: 86)
            )
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
    }
}

/*#Preview {
    NavigationStack {
        HomeView()
    }
}
*/
#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(ChallengeProgressViewModel()) // 👈 agregar esto
    }
}

