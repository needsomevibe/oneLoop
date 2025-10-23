//
//  Calendar.swift
//  oneLoop
//
//  Created by José Miguel Guerrero Jiménez on 17/10/25.
//


import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var progressVM: ChallengeProgressViewModel
    @State private var currentDate = Date()
    private let calendar = Calendar.current
    
    private var daysInMonth: [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: currentDate) else { return [] }
        var dates: [Date] = []
        var date = monthInterval.start
        while date < monthInterval.end {
            dates.append(date)
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }
        return dates
    }
    
    private var monthAndYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentDate).capitalized
    }
    
    private var daysOfWeek: [String] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        return formatter.shortWeekdaySymbols
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Encabezado del mes
            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(monthAndYear)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.blueDemon)
                Spacer()
                Button(action: { changeMonth(by: 1) }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)
            
            // Días de la semana
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day.prefix(2).uppercased())
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blueDemon)
                }
            }
            
            // Días del mes
            let firstWeekday = calendar.component(.weekday, from: daysInMonth.first ?? Date()) - 1
            let emptyCells = Array(repeating: "", count: firstWeekday)
            let totalDays = emptyCells.map { _ in Optional<Date>.none } + daysInMonth.map { Optional($0) }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(totalDays, id: \.self) { date in
                    if let date = date {
                        DayView(
                            date: date,
                            currentDate: currentDate,
                            hasChallenge: progressVM.completedDates.contains { calendar.isDate($0, inSameDayAs: date) }
                        )
                    } else {
                        Text("")
                            .frame(height: 40)
                    }
                }
            }
            .padding(.horizontal, 4)
        }
        .padding()
        .animation(.easeInOut, value: currentDate)
    }
    
    private func changeMonth(by value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: currentDate) {
            currentDate = newDate
        }
    }
}

#Preview {
    let vm = ChallengeProgressViewModel()
    vm.completedDates = [
        Date(),
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -3, to: Date())!
    ]
    
    return CalendarView()
        .environmentObject(vm)
}

