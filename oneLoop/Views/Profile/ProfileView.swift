//
//  ProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("profileImage") private var profileImageData: Data?
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("userSurname") private var userSurname: String = ""
    
    @State private var showEdit = false

    var body: some View {
        VStack() {
            
            if let data = profileImageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(radius: 20)
                    
            }
            
            Text("\(userName) \(userSurname)")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text("Your Activity")
                .font(.title2)
                .foregroundColor(.blueDemon)
            
            CalendarView()
            
            Button("Edit Info") {
                showEdit = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.blueDemon)
            .padding(.top)
            
        }
        .sheet(isPresented: $showEdit) {
            NoProfileView() // Reutilizamos la misma vista para editar datos
        }
        .padding()
        .background(Color.backBlue.ignoresSafeArea())
    }
}

