import SwiftUI
import Combine
import Foundation

// User preferences model
class UserPreferences: ObservableObject {
    @Published var textInput: String = ""
    @Published var selectedOption: String = "Month"
}

// Learning goal data model
class LearningGoalData: ObservableObject {
    @Published var learningTopic: String = ""
    @Published var selectedDuration: String = "Month"
    @Published var streak: Int = 0
    @Published var freezesUsed: Int = 0
    @Published var maxFreezes: Int = 6
    @Published var todayLearned: Bool = false
    @Published var FrezzLearned: Bool = false
    @Published var circleColor = Color.clear
}

// Date data model
class DateData: ObservableObject {
    @Published var selectedDate = Date()
    let calendar = Calendar.current

    func generateDaysForWeek() -> [Date] {
        var days = [Date]()
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: selectedDate)!.start
        for i in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: i, to: startOfWeek) {
                days.append(day)
            }
        }
        return days
    }
}
