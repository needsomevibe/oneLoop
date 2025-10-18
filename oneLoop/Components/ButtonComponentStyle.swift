//
//  ButtonComponentStyle.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 18/10/25.
//

import SwiftUI

struct ButtonComponentStyle: View {
    let title: String
    let cornerRadius: CGFloat
    let tint: Color

    init(title: String, cornerRadius: CGFloat = 14, tint: Color = .blue) {
        self.title = title
        self.cornerRadius = cornerRadius
        self.tint = tint
    }

    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .semibold))
            .frame(maxWidth: .infinity, minHeight: 56)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(tint)
                    .frame(width: 350, height: 86)
            )
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
    }
}



