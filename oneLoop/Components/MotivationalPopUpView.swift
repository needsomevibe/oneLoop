//
//  MotivationalPopUpView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 16/10/25.
//

import SwiftUI

struct MotivationalPopupView: View {
    var title: String
    var message: String
    var onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.9))

            Button(action: onDismiss) {
                Text("OK")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blueDemon)
                    .cornerRadius(10)
            }
            .padding(.top, 8)
        }
        .padding(24)
        .background(Color.blueDemon)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
}


