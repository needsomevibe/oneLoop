//
//  ChallengeCardd.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 15/10/25.
//

import SwiftUI

struct ChallengeCardd: View {
    let title: String   //We declare with let in order to use it as parameters
    let subtitle: String
    
    var body: some View {
        ZStack {
            // Background shadow card (the one slightly behind)
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue)
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
                            Text(title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        Spacer()
                        
                        Button(action: {
                            print("Start tapped")
                        }) {
                            Text("START")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal, 24)
                )
        }
        .padding(.horizontal)
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            ChallengeCardd(
                title: "Challenge 1",
                subtitle: "Asking for Information"
            )
            ChallengeCardd(
                title: "Challenge 2",
                subtitle: "Making Requests"
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
