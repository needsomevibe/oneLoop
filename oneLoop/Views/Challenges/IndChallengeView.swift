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
    @Environment(\.dismiss) var dismiss // 👈 Agregado

    @State private var showPopup = false
    @State private var showPopup2 = false

    private var motivationalMessage: String {
        switch challenge.title.lowercased() {
        case "challenge 1":
            return "You took a step forward today — every small action counts."
        case "challenge 2":
            return "You showed courage by facing a challenge — that builds confidence. Keep going!"
        case "challenge 3":
            return "You practiced persistence and focus — that strengthens your skills."
        case "challenge 4":
            return "You reflected on your experience — self-awareness is powerful. Keep shining!"
        default:
            return "You did it — you reached out and spoke up! Even tiny steps are huge wins when facing anxiety."
        }
    }
    
    private var nonmotivationalMessage: String {
        switch challenge.title.lowercased() {
            case "challenge 1":
            return "It’s okay if you didn’t feel ready today — healing takes time, not pressure."
        case "challenge 2":
            return "Some days are harder than others, and that’s human. You can come back when it feels right."
        case "challenge 3":
            return "Not today doesn’t mean never — you’re still moving forward at your own pace."
        case "challenge 4":
            return "You’re allowed to take small steps. Pausing is part of progress too."
        default:
            return "Be kind to yourself — courage grows slowly, and you’re still on the journey."
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
                            dismiss()
                        }
                    }
                )
                .transition(AnyTransition.scale.combined(with: .opacity))
                .zIndex(1)
            }
             if showPopup2 {
                MotivationalPopupView(
                    title: "Great job on \(challenge.title)!",
                    message: nonmotivationalMessage,
                    onDismiss: {
                        withAnimation {
                            showPopup2 = false
                            dismiss()
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
                        .foregroundColor(.blueDemon)
                    //Spacer()
                }
                .padding(.horizontal)

                CompleteChallengeCard(challenge: challenge)
                    .padding(.bottom)

                HStack {
                    ActionButtonCard(title: "Not Now", icon: "arrowshape.turn.up.left") {
                        withAnimation {
                            
                            
                            showPopup2 = true
                            
                        }
                    }
                    ActionButtonCard(title: "Got it!", icon: "hands.clap.fill") {
                        withAnimation {
                            /*if progressVM.completedChallenges < progressVM.totalChallenges {
                                progressVM.completedChallenges += 1
                            }*/
                            progressVM.addCompletedChallenge()
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

