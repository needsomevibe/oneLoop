//
//  NoProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI

struct NoProfileView: View {
    @AppStorage("profileImage") private var profileImageData: Data?

    
    var body: some View {
        ZStack {
            Color.backBlue
                .ignoresSafeArea()
            VStack{
                ImagePickerCircleView(imageData: $profileImageData)
                
                textFieldOL(text: "Name", textfield: "Write your name")
                    .padding()
                textFieldOL(text: "Surname", textfield: "Write your surname")
                    .padding()
            }
        }
    }
}

#Preview {
    NoProfileView()
}
