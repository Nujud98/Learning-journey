import Foundation
import SwiftUI

// ViewModel for managing streaks, freezes, and learning status
class LearningGoalViewModel: ObservableObject {
    @Published var model: LearningGoalData

    init(model: LearningGoalData) {
        self.model = model
    }

    func toggleTodayLearned() {
        model.todayLearned.toggle()
        if model.todayLearned {
            model.circleColor = Color.orange.opacity(0.4)
            model.streak += 1
        } else {
            model.circleColor = Color.clear
            model.streak -= 1
        }
    }

    func freezeDay() {
        guard model.freezesUsed < model.maxFreezes else { return }
        model.FrezzLearned = true
        model.freezesUsed += 1
        model.circleColor = Color.blue.opacity(0.4)
    }
}
