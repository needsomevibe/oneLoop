//
//  header.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct header: View {
    var body: some View {
        HStack {
            // Invisible spacer to balance the trailing image width if needed
            Color.clear
                .frame(width: 50, height: 50)
                .opacity(0)

            Text("Bloom")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .center)

            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .frame(alignment: .trailing)
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

#Preview {
    header()
}

