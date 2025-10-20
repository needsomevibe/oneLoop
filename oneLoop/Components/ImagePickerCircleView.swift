//
//  ImagePickerCircleView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//


import SwiftUI
import PhotosUI

struct ImagePickerCircleView: View {
    @Binding var imageData: Data?
    @State private var selectedItem: PhotosPickerItem?
    @State private var showPicker = false   // ✅ Ahora usamos este booleano

    var body: some View {
        VStack {
            if let imageData,
               let uiImage = UIImage(data: imageData) {
                // ✅ Mostrar imagen guardada
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .onTapGesture {
                        showPicker = true   // ✅ Permite cambiar la imagen
                    }
            } else {
                // ✅ Placeholder si no hay imagen
                Button {
                    showPicker = true
                } label: {
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
            }
        }
        .photosPicker(isPresented: $showPicker, selection: $selectedItem, matching: .images)
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    imageData = data   // ✅ Se guarda correctamente
                }
            }
        }
    }
}


