import Foundation

extension Date {
    func datesForCurrentWeek() -> [Date] {
        guard let weekInterval = Calendar.current.dateInterval(of: .weekOfYear, for: self) else {
            return []
        }
        var dates: [Date] = []
        var currentDate = weekInterval.start
        for _ in 0..<7 {
            dates.append(currentDate)
            if let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) {
                currentDate = nextDate
            }
        }
        return dates
    }
    
    func isToday() -> Bool {
        Calendar.current.isDateInToday(self)
    }
}
