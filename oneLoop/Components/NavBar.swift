//
//  NavBar.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct NavBar: View {
    var onHomeTapped: (() -> Void)? = nil
    var onTrophyTapped: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            Divider() // horizontal line above the icons

            HStack {
                Button {
                    onHomeTapped?()
                } label: {
                    Image(systemName: "house.fill")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundStyle(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.plain)

                Button {
                    onTrophyTapped?()
                } label: {
                    Image(systemName: "trophy.fill")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundStyle(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.plain)
            }
            .background(Color.white)
            .padding(.horizontal, 24)
            .padding(.bottom, 8) // slight bottom padding for comfort
        }
        .background(Color.white)
    }
}

#Preview {
    VStack {
        Spacer()
        NavBar(
            onHomeTapped: { print("Home tapped") },
            onTrophyTapped: { print("Trophy tapped") }
        )
    }
    .background(Color(.systemGroupedBackground))
    .ignoresSafeArea(edges: .bottom)
}
