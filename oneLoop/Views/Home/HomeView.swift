//
//  HomeView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct HomeView: View {

    
    @EnvironmentObject var progressVM: ChallengeProgressViewModel
    var body: some View {
        VStack (spacing: 42){
            header()
                
            //Spacer()

            NavigationLink {
                ChallengesView(level: levels[0])
            } label: {
                ButtonComponentStyle(title: "Level 1", cornerRadius: 12)
            }

            NavigationLink {
                ChallengesView(level: levels[1])
            } label: {
                ButtonComponentStyle(title: "Level 2", cornerRadius: 16)
                    .opacity(progressVM.completedChallenges < 3 ? 0.5 : 1)
                   

            }
            .disabled(progressVM.completedChallenges < 3)

            NavigationLink {
                ChallengesView(level: levels[2])
            } label: {
                ButtonComponentStyle(title: "Level 3", cornerRadius: 20)
                    .opacity(progressVM.completedChallenges < 6 ? 0.5 : 1)
            }
            .disabled(progressVM.completedChallenges < 6)

            NavigationLink {
                ChallengesView(level: levels[3])
            } label: {
                ButtonComponentStyle(title: "Level 4") // default 14
                    .opacity(progressVM.completedChallenges < 9 ? 0.5 : 1)
            }
            .disabled(progressVM.completedChallenges < 9)
            NavigationLink {
                ChallengesView(level: levels[4])
            } label: {
                ButtonComponentStyle(title: "Level 5") // default 14
                    .opacity(progressVM.completedChallenges < 12 ? 0.5 : 1)
            }
            .disabled(progressVM.completedChallenges < 12)
            
            
            VStack {
                Text("\(progressVM.completedChallenges)")
                    .font(.callout.bold())
                    .foregroundColor(.blueDemon)
                    .padding(.top, 10)
                Text("Challenges Completed")
                    .font(.caption2)
                    .foregroundColor(Color.blueaccent)
            }
            

            Spacer()
        }
        .background(Color(.backBlue))
    }
}


#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(ChallengeProgressViewModel()) // 👈 agregar esto
    }
}

