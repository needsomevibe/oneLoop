//
//  ActionButtonCard.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 18/10/25.
//

import SwiftUI

struct ActionButtonCard: View {
    let title: String
    let icon: String
    let action: () -> Void

    init(title: String, icon: String, action: @escaping () -> Void = {}) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding(.vertical, 14)
            .padding(.horizontal, 30)
            .background(Color.blueDemon)
            .cornerRadius(14)
        }
    }
}

#Preview {
    ActionButtonCard(title: "Got it!", icon: "hands.clap.fill") { }
}
