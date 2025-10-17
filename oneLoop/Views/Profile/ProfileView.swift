//
//  ProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.backBlue
                .ignoresSafeArea() // 🔹 Hace que el color cubra toda la pantalla
            
            VStack {
                Image("Mcqueen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(radius: 30)
               
                Text("Lightning Mcqueen")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.blue)
                
                Text("Your Activity")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.white)
                
                CalendarView()
            }
        }
    }
}

#Preview {
    ProfileView()
}

