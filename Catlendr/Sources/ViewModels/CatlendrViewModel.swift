import Foundation
import Combine

enum AnimalType {
    case cat, dog
}

class CatlendrViewModel: ObservableObject {
    @Published var calendarDays = [CalendarDay]()
    @Published var errorMessage: String?
    @Published var isLoading = false
    private let animalAPI: AnimalAPI
    
    init(animalAPI: AnimalAPI = AnimalAPI()) {
        self.animalAPI = animalAPI
    }
    
    func fetchAnimalImages(for animalType: AnimalType) async {
        DispatchQueue.main.async {
            self.errorMessage = nil
            self.isLoading = true
        }
        let weekDates = Date().datesForCurrentWeek()
        let request = animalType == .cat ?  AnimalAPIRequest.cat(amount: weekDates.count) : AnimalAPIRequest.dog(amount: weekDates.count)
        do {
            let animals = try await AnimalAPI().getAnimals(request: request)
            DispatchQueue.main.async {
                self.calendarDays = zip(weekDates, animals).map { (date, animal) in
                    CalendarDay(date: date, animal: animal)
                }
                self.isLoading = false
            }
        } catch let error {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}


