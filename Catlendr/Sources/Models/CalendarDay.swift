import Foundation

struct CalendarDay: Identifiable {
    let id = UUID()
    let date: Date
    let animal: Animal
    
    init(date: Date, animal: Animal) {
        self.date = date
        self.animal = animal
    }
    
    var localizedDayOfWeek: String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
