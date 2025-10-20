//
//  IndChallengeView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 16/10/25.
//

import SwiftUI

struct IndChallengeView: View {
    let challenge: ChallengeDetail
    @EnvironmentObject var progressVM: ChallengeProgressViewModel

    @State private var showPopup = false

    // Mensaje dinámico según el challenge
    private var motivationalMessage: String {
        switch challenge.title.lowercased() {
        case "challenge 1":
            return "¡Primer paso logrado! Cada conversación te hace más fuerte."
        case "challenge 2":
            return "Excelente avance. Estás construyendo confianza día a día."
        case "challenge 3":
            return "¡Gran trabajo! Tu valentía está dando frutos."
        case "challenge 4":
            return "Impresionante constancia. Sigue así, estás creciendo mucho."
        default:
            return "You did it — you reached out and spoke up! Even tiny steps are huge wins when facing anxiety."
        }
    }

    var body: some View {
        ZStack {
            Color.backBlue.ignoresSafeArea()
            if showPopup {
                MotivationalPopupView(
                    title: "Great job on \(challenge.title)!",
                    message: motivationalMessage,
                    onDismiss: {
                        withAnimation {
                            showPopup = false
                        }
                    }
                )
                .transition(AnyTransition.scale.combined(with: .opacity))
                .zIndex(1)
            }
            VStack {
                HStack {
                    Text(challenge.title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    /*Button("Done") {
                        withAnimation {
                            showPopup = true
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.blue)*/
                }
                .padding(.horizontal)

                CompleteChallengeCard(challenge: challenge)
                    .padding(.bottom)
                HStack{
                    ActionButtonCard(title: "Not Now", icon: "arrowshape.turn.up.left") {
                        // optional action for "Not Now"
                    }
                    ActionButtonCard(title: "Got it!", icon: "hands.clap.fill") {
                        withAnimation {
                            //progressVM.completedChallenges += 1
                            if progressVM.completedChallenges < progressVM.totalChallenges {
                                progressVM.completedChallenges += 1
                            }

                            showPopup = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    IndChallengeView(
        challenge: ChallengeDetail(
            title: "Challenge 1",
            subtitle: "Avanza 10k",
            objective: "Completa tu primer 10k esta semana.",
            steps: ["Entrena 5k", "Corre 5k", "Corre 10k"]
        )
    )
}

