//
//  ImagePickerCircleView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerCircleView: View {
    @State private var selectedItem: PhotosPickerItem?=nil
    @State private var selectedImageData: Data?=nil
    var body: some View {
        VStack {
                   // Si hay imagen seleccionada, la mostramos
                   if let selectedImageData,
                      let uiImage = UIImage(data: selectedImageData) {
                       Image(uiImage: uiImage)
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 280, height: 280)
                           .clipShape(Circle())
                           .shadow(radius: 10)
                           .onTapGesture {
                               selectedItem = nil // Si quieres resetear o volver a elegir
                           }
                   } else {
                       // Si no hay imagen, mostramos el círculo gris
                       PhotosPicker(selection: $selectedItem, matching: .images) {
                           Circle()
                               .frame(width: 280, height: 280)
                               .foregroundColor(.gray.opacity(0.4))
                               .overlay(
                                   VStack {
                                       Image(systemName: "photo")
                                           .font(.system(size: 50))
                                           .foregroundColor(.white)
                                       Text("Select an image")
                                           .foregroundColor(.white)
                                           .font(.headline)
                                   }
                               )
                       }
                       .padding()
                   }
               }
               // Cuando cambia la selección, cargamos la imagen
               .onChange(of: selectedItem) { newItem in
                   Task {
                       if let data = try? await newItem?.loadTransferable(type: Data.self) {
                           selectedImageData = data
                       }
                   }
               }
    }
}

#Preview {
    ImagePickerCircleView()
}
