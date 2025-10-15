//
//  ScreenTitle.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 15/10/25.
//

import SwiftUI

struct ScreenTitle: View {
    let title: String
    var body: some View {
        // Screen title
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)    }
}

#Preview {
    ScreenTitle(title: "Hello")
}
