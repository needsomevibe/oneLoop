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
                    .opacity(progressVM.completedChallenges < 5 ? 0.5 : 1)
                    //.disabled(progressVM.completedChallenges > 5)

            }

            NavigationLink {
                ChallengesView(title: "Level 3")
            } label: {
                ButtonComponentStyle(title: "Level 3", cornerRadius: 20)
                    .opacity(progressVM.completedChallenges < 10 ? 0.5 : 1)
            }

            NavigationLink {
                ChallengesView(title: "Level 4")
            } label: {
                ButtonComponentStyle(title: "Level 4") // default 14
                    .opacity(progressVM.completedChallenges < 15 ? 0.5 : 1)
            }
            
            
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


#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(ChallengeProgressViewModel()) // 👈 agregar esto
    }
}

