//
//  textFieldOL.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI

struct textFieldOL: View {
    let text: String
    let textfield: String
    var body: some View {
        VStack{
            Text(text + ":")
                .font(.callout)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
            TextField(textfield + "...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                
        }
        
    }
}

#Preview {
    textFieldOL(text: "Name", textfield: "Write your name")
}
