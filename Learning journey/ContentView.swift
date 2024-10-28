import SwiftUI
import Foundation
import Combine

class UserData: ObservableObject {
    @Published var textInput: String = ""
    @Published var selectedOption: String = "Month"
}

struct ContentView: View {
    @StateObject var userData = UserData()
    @State private var selectedTimeframe: String = "Month"
    @State private var learningTopic: String = ""
    @State private var selectedGoal = "Swift"
    @State private var selectedFuration = "Month"
    @State private var navigateToHome = false
    @State private var learning = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        Image("fire")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.orange)
                    }
                    .padding(.top, 50)
                    
                    Text("Hello Learner!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, -5)
                        .padding(.leading, -99)
                    
                    Text("This app will help you learn everyday")
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                        .padding(.leading, -50)
                    
                    // Learning Topic TextField
                    VStack(alignment: .leading) {
                        Text("I want to learn")
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 8) {
                            TextField("Swift", text: $learning)
                                .foregroundColor(.gray)
                                .accentColor(.orange)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray).opacity(0.5), alignment: .bottom
                                )
                                .padding(.horizontal, 1)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                    .padding(.horizontal, 40)
                    
                    // Timeframe Selection
                    VStack(alignment: .leading) {
                        Text("I want to learn it in a")
                            .foregroundColor(.white)
                            .padding(.leading, -2)
                        
                        HStack(spacing: 20) {
                            FurationButton(title: "Week", isSelected: selectedFuration == "Week") {
                                selectedFuration = "Week"
                            }
                            
                            FurationButton(title: "Month", isSelected: selectedFuration == "Month") {
                                selectedFuration = "Month"
                            }
                            
                            FurationButton(title: "Year", isSelected: selectedFuration == "Year") {
                                selectedFuration = "Year"
                            }
                        }
                        .padding(.bottom, 50)
                    }
                    .padding(.horizontal, 40)
                    
                    // Start Button
                    Button(action: {
                        navigateToHome = true
                    }) {
                        Text("Start →")
                            .colorInvert()
                            .frame(width: 151, height: 25)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    .navigationDestination(isPresented: $navigateToHome) {
                        learninghome(language: learning)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct FurationButton: View {
    var title: String
    var isSelected: Bool
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
