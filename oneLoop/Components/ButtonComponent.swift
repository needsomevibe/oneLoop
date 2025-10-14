//
//  ButtonComponent.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 14/10/25.
//

import SwiftUI

struct ButtonComponent: View {
    @Binding var text: String
    
    var body: some View {
        Button {
            text = "Hello Learners!"
        } label: {
            Text("Random")
                .font(.system(size: 20, weight: .semibold)) // larger label
                .frame(maxWidth: .infinity) // expand horizontally
        }
        .controlSize(.large)
        .buttonStyle(.glassProminent)
        .tint(.blue) // change color here
        .frame(maxWidth: .infinity, minHeight: 56) // larger height and full width
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    ButtonComponent(text: .constant("Random"))
}
