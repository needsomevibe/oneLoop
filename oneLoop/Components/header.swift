//
//  header.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct header: View {
    @State private var isModalOpened: Bool = false
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

            Button(action: {
                isModalOpened.toggle()
            }) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .frame(alignment: .trailing)
                    .foregroundColor(Color.black)
            }
           
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .sheet(isPresented: $isModalOpened){
            NoProfileView()
        }
    }
}

#Preview {
    header()
}

