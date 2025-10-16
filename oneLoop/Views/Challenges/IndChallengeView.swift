//
//  IndChallengeView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 16/10/25.
//

import SwiftUI

struct IndChallengeView: View {
    @State private var showPopup = false
    var body: some View {
        ZStack {
            Color.backBlue.ignoresSafeArea()
            if showPopup {
                            MotivationalPopupView(
                                title: "You did it — you reached out and spoke up!",
                                message: "Even tiny steps are huge wins when facing anxiety.",
                                onDismiss: {
                                    withAnimation {
                                        showPopup = false
                                    }
                                }
                            )
                            .transition(.scale.combined(with: .opacity))
                            .zIndex(1)
                        }
            VStack{
                HStack {
                    Text("Challenge 1")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Button("Done") {
                        withAnimation {
                            showPopup = true
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                }
                .padding(.horizontal)
                CompleteChallengeCard(title: "Challenge 1", subtitle: "Instructions", objective: "jajsjsjsjsjs", step1: "Find someone", step2: "Call it", step3: "Introduce Yourself")
            }
        }
        //.background(Color.white)
        
        
    }
}

#Preview {
    IndChallengeView()
}
