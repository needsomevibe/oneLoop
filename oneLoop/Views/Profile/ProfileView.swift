//
//  ProfileView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: 250, height: 250)
                .foregroundColor(.gray)
                .padding()
            Text("Lightning Mcqueen")
                .font(Font.largeTitle)
                .bold()
                .foregroundStyle(Color.blue)
            Text("Your Activity")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.blue)
            List{
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
        }
            }
}

#Preview {
    ProfileView()
}
