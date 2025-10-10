//
//  StreakSection.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 10/10/25.
//

import SwiftUI

struct StreakSection: View {
    let weekDays: [String]      // e.g., ["SAN","MON","TUE","WED","THU","FRI","SAT"]
    let dates: [Int]            // e.g., [15,16,17,18,19,20,21]
    let selectedIndices: Set<Int>

    init(weekDays: [String], dates: [Int], selectedIndices: [Int]) {
        self.weekDays = weekDays
        self.dates = dates
        self.selectedIndices = Set(selectedIndices)
    }

    var body: some View {
        VStack(spacing: 12) {
            // Weekday row
            HStack(spacing: 18) {
                ForEach(Array(weekDays.enumerated()), id: \.offset) { _, day in
                    Text(day)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }

            // Dates row
            HStack(spacing: 18) {
                ForEach(Array(dates.enumerated()), id: \.offset) { index, date in
                    let selected = selectedIndices.contains(index)
                    ZStack {
                        Circle()
                            .fill(selected ? Color.accentColor : Color.clear)
                            .frame(width: 34, height: 34)
                        Text("\(date)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(selected ? .white : .primary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 18)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.12), radius: 20, x: 0, y: 12)
        )
    }
}

#Preview {
    StreakSection(
        weekDays: ["SAN","MON","TUE","WED","THU","FRI","SAT"],
        dates: [15,16,17,18,19,20,21],
        selectedIndices: [1,2,3,4]
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
