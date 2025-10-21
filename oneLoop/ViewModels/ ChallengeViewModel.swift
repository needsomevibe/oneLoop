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
    @AppStorage("completedDates") private var completedDatesData: Data = Data()
    
    @Published var completedDates: [Date] = [] {
           didSet {
               saveCompletedDates()
           }
       }
    
    let totalChallenges: Int = 16  // o cámbialo si tienes otro total
    
    init() {
           loadCompletedDates()
       }

       func addCompletedChallenge() {
           completedChallenges += 1
           completedDates.append(Date())
       }

       private func saveCompletedDates() {
           if let encoded = try? JSONEncoder().encode(completedDates) {
               completedDatesData = encoded
           }
       }

       private func loadCompletedDates() {
           if let decoded = try? JSONDecoder().decode([Date].self, from: completedDatesData) {
               completedDates = decoded
           }
       }
}
