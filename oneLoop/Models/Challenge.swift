//
//  Challenge.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import Foundation
struct Challenge: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let xp: Int
}
