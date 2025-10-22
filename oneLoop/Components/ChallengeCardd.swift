//
//  ChallengeCardd.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 15/10/25.
//

import SwiftUI

struct ChallengeCardd: View {
    let challenge: ChallengeDetail
    
    @State var isModalOpened: Bool = false
    
    var body: some View {
        ZStack {
            // Background shadow card (the one slightly behind)
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blueDemon)
                .frame(height: 120)
                .offset(y: 6)
            
            // Foreground white card
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 3)
                .frame(height: 120)
                .overlay(
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(challenge.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text(challenge.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        Spacer()
                        
                        Button(action: {
                            isModalOpened.toggle()
                        }) {
                            Text("START")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.blueDemon)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal, 24)
                    .sheet(isPresented: $isModalOpened){
                        IndChallengeView(challenge: challenge)
                    }
                )
        }
        .padding(.horizontal)
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            ChallengeCardd(
                challenge: ChallengeDetail(
                    title: "Challenge 1",
                    subtitle: "Asking for Information",
                    objective: "Try to ask for information politely and clearly.",
                    steps: ["Find someone", "Ask your question", "Thank them"]
                )
            )
            ChallengeCardd(
                challenge: ChallengeDetail(
                    title: "Challenge 2",
                    subtitle: "Making Requests",
                    objective: "Learn to make simple requests with confidence.",
                    steps: ["Identify your need", "Formulate your request", "Acknowledge the response"]
                )
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
