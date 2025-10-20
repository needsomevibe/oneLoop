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
            Color.clear.frame(width: 50, height: 50) // Spacer invisible
            Text("Bloom")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button(action: { isModalOpened.toggle() }) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $isModalOpened) {
            // Decide qué mostrar dentro del sheet
            if let _ = UserDefaults.standard.data(forKey: "profileImage"),
               let _ = UserDefaults.standard.string(forKey: "userName"),
               let _ = UserDefaults.standard.string(forKey: "userSurname") {
                ProfileView()
            } else {
                NoProfileView()
            }
        }
    }
}

#Preview {
    header()
}

