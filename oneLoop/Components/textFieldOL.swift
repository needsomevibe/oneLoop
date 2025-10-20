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
    @Binding var value: String
    var body: some View {
        VStack{
            Text(text + ":")
                .font(.callout)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
            TextField(textfield + "...", text: $value)
                .padding(.horizontal)
                
        }
        
    }
}


