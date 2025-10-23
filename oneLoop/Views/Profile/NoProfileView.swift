//
//  NoProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//



import SwiftUI

struct NoProfileView: View {
    @AppStorage("profileImage") private var profileImageData: Data?
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("userSurname") private var userSurname: String = ""
    
    @Environment(\.dismiss) var dismiss // Para cerrar el sheet después de crear perfil

    var body: some View {
        ZStack{
            Color.backBlue // 👈 Aquí va tu color de fondo personalizado
                            .ignoresSafeArea() // Para que cubra toda la pantalla
            VStack(spacing: 20) {
                ImagePickerCircleView(imageData: $profileImageData)
                
                textFieldOL(text: "Name", textfield: "Write your name", value: $userName)
                    .foregroundStyle(Color.blueaccent)
                textFieldOL(text: "Surname", textfield: "Write your surname", value: $userSurname)
                    .foregroundStyle(Color.blueaccent)

                
                Button("Confirm") {
                    dismiss() // Cierra el sheet automáticamente
                }
                .buttonStyle(.borderedProminent)
                .disabled(userName.isEmpty || userSurname.isEmpty || profileImageData == nil)
                .tint(Color.blueDemon)
            }
            .padding()
        }
        
        
    }
}


