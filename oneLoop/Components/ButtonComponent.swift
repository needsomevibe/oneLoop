//
//  ButtonComponent.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 14/10/25.
//

import SwiftUI

struct ButtonComponent: View {
    // Visible label of the button (only parameter you want)
    let title: String

    // Optional tap action so callers can react if needed
    var action: (() -> Void)? = nil

    // Customizable corner radius (default provided)
    let cornerRadius: CGFloat

    // Optional tint color (keeps prior blue default)
    let tint: Color

    init(
        title: String,
        cornerRadius: CGFloat = 14,
        tint: Color = .blue,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.cornerRadius = cornerRadius
        self.tint = tint
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 56)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(tint)
                        .frame(width: 350, height: 86)
                )
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }
}

#Preview {
    VStack(spacing: 42) {
        ButtonComponent(title: "Level 1", cornerRadius: 12)
        ButtonComponent(title: "Level 2") // default corner radius 14
        ButtonComponent(title: "Accent", cornerRadius: 20, tint: .purple)
    }
    .padding()
}
