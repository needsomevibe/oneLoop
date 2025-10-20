//
//  NoProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//


//import SwiftUI

/*struct NoProfileView: View {
    @AppStorage("profileImage") private var profileImageData: Data?
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("userSurname") private var userSurname: String = ""
    @AppStorage("profileCreated") private var profileCreated: Bool = false

    
    @State private var goToProfile = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backBlue.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    ImagePickerCircleView(imageData: $profileImageData)
                    
                    textFieldOL(text: "Name", textfield: "Write your name", value: $userName)
                    textFieldOL(text: "Surname", textfield: "Write your surname", value: $userSurname)
                    
                    Button(action: {
                        goToProfile = true
                    }) {
                        Text("Create Profile")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                    .disabled(userName.isEmpty || userSurname.isEmpty || profileImageData == nil)
                    .opacity(userName.isEmpty || userSurname.isEmpty || profileImageData == nil ? 0.5 : 1)
                    
                    NavigationLink("", destination: ProfileView(), isActive: $goToProfile)
                        .hidden()
                }
                .padding()
            }
        }
    }
}

*/
import SwiftUI

struct NoProfileView: View {
    @AppStorage("profileImage") private var profileImageData: Data?
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("userSurname") private var userSurname: String = ""
    
    @Environment(\.dismiss) var dismiss // Para cerrar el sheet después de crear perfil

    var body: some View {
        VStack(spacing: 20) {
            ImagePickerCircleView(imageData: $profileImageData)
            
            textFieldOL(text: "Name", textfield: "Write your name", value: $userName)
            textFieldOL(text: "Surname", textfield: "Write your surname", value: $userSurname)
            
            Button("Confirm") {
                dismiss() // Cierra el sheet automáticamente
            }
            .buttonStyle(.borderedProminent)
            .disabled(userName.isEmpty || userSurname.isEmpty || profileImageData == nil)
        }
        .padding()
    }
}


