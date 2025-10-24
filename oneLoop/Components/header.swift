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
            Text("Levels")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blueDemon)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button(action: { isModalOpened.toggle() }) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blueDemon)
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

