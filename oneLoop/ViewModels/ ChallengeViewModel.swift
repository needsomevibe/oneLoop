//
//  ProgressViewModel.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 18/10/25.
//

import Foundation
import SwiftUI
import Combine

class ChallengeProgressViewModel: ObservableObject {
    @AppStorage("completedChallenges") var completedChallenges: Int = 0
    let totalChallenges: Int = 20  // o cámbialo si tienes otro total
}
