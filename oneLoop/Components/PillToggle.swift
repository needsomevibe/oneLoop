//
//  PillToggle.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct PillToggle: View {
    enum Selection { case left, right }

    let leftTitle: String
    let rightTitle: String
    @Binding var selection: Selection

    var body: some View {
        HStack(spacing: 12) {
            pill(title: leftTitle, isSelected: selection == .left) {
                selection = .left
            }
            pill(title: rightTitle, isSelected: selection == .right) {
                selection = .right
            }
            //Spacer()
        }
        
    }

    @ViewBuilder
    private func pill(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(isSelected ? .white : .primary.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule(style: .continuous)
                        .fill(isSelected ? Color.accentColor : Color(.systemGray5))
                )
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.25, dampingFraction: 0.8), value: isSelected)
    }
}

#Preview {
    StatefulPreviewWrapper(PillToggle.Selection.left) { selection in
        PillToggle(leftTitle: "Daily", rightTitle: "Random", selection: selection)
            .padding()
    }
}

// Small helper to preview bindings
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }

    var body: some View { content($value) }
}
