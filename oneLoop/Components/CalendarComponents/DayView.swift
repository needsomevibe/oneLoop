//
//  DayView.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 20/10/25.
//


import SwiftUI

struct DayView: View {
    let date: Date
    let currentDate: Date
    let hasChallenge: Bool
    private let calendar = Calendar.current

    var body: some View {
        let day = calendar.component(.day, from: date)
        let isToday = calendar.isDateInToday(date)

        VStack(spacing: 4) {
            Text("\(day)")
                .frame(width: 36, height: 36)
                .background(
                    isToday ? Color.blueDemon.opacity(0.8) :
                        (hasChallenge ? Color.blueDemon.opacity(0.3) : Color.clear)
                )
                .clipShape(Circle())
                .foregroundColor(isToday ? .blueaccent : .blueaccent)
            
            if hasChallenge {
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.blueDemon)
            }
        }
    }
}

