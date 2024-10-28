import SwiftUI

struct ContentView: View {
    @ObservedObject var userPreferences = UserPreferences()
    @StateObject var learningGoalData = LearningGoalData()
    @State private var navigateToHome = false
    var selectedLanguage = "Swift"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Hello Learner!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("This app will help you learn everyday")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text("I want to learn")
                            .foregroundColor(.white)
                        
                        TextField("Swift", text: $learningGoalData.learningTopic)
                            .foregroundColor(.gray)
                            .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.5)), alignment: .bottom)
                            .padding(.horizontal)
                    }.padding(.horizontal, 40)
                    
                    VStack(alignment: .leading) {
                        Text("I want to learn it in a")
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            DurationButton(title: "Week", isSelected: Binding(get: { learningGoalData.selectedDuration == "Week" }, set: { if $0 { learningGoalData.selectedDuration = "Week" } })) {
                                learningGoalData.selectedDuration = "Week"
                            }
                            
                            DurationButton(title: "Month", isSelected: Binding(get: { learningGoalData.selectedDuration == "Month" }, set: { if $0 { learningGoalData.selectedDuration = "Month" } })) {
                                learningGoalData.selectedDuration = "Month"
                            }
                            
                            DurationButton(title: "Year", isSelected: Binding(get: { learningGoalData.selectedDuration == "Year" }, set: { if $0 { learningGoalData.selectedDuration = "Year" } })) {
                                learningGoalData.selectedDuration = "Year"
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    Button(action: {
                        navigateToHome = true
                    }) {
                        Text("Start →")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: LearningHomeView(language: selectedLanguage), isActive: $navigateToHome) {
                        EmptyView()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

// هنا إضافة DurationButton
struct DurationButton: View {
    var title: String
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(isSelected ? .black : .orange)
                .background(isSelected ? Color.orange : Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
    }
}
