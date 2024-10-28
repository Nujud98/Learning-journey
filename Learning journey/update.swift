import SwiftUI

struct updateView: View {
    @State private var learning = ""
    @State private var selectedGoal = "Swift"
    @State private var selectedDuration = "Month"
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        NavigationView {
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    HStack {
                        Button(action: {
                        }) {
//                            HStack {
//                                Image(systemName: "chevron.left")
//                                    .foregroundColor(.orange)
//
//                                Text("Back")
//                                    .foregroundColor(.orange)
//                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        Text("Learning goal")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading,50)
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Text("Update")
                                .foregroundColor(.orange)
                        }
                        .padding()
                    }
                    .padding(.top,-48)
                    Spacer()
                    
                    
                }
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Section for learning goal
//                    Text("I want to learn")
//                        .foregroundColor(.white)
//                        .font(.system(size: 20, weight: .medium))
//                        .padding(.top,30)
                    VStack{
                                    Text("I want to learn")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.leading ,-180)
                                        .padding(.top,40)
                                    TextField("Swift", text: $learning)
                                        .foregroundColor(.gray)
                                        .accentColor(.orange)
                                        .overlay(
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.gray).opacity(0.5),alignment: .bottom )
                                        .padding(.horizontal, 20)
                                        .padding(.top,35)
                                }
                    
//                        .cornerRadius(10)
//                    Rectangle()
//                        .frame(height: 1)
//                        .foregroundColor(.gray)
//                    
                    // Section for learning duration
                    Text("I want to learn it in a")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                        
                    
                    HStack(spacing: 20) {
                        DurationButton(title: "Week", isSelected: selectedDuration == "Week") {
                            selectedDuration = "Week"
                        }
                        
                        DurationButton(title: "Month", isSelected: selectedDuration == "Month") {
                            selectedDuration = "Month"
                        }
                        
                        DurationButton(title: "Year", isSelected: selectedDuration == "Year") {
                            selectedDuration = "Year"
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding()
//                .padding(.top,50)

            }
        }
    }
}

struct DurationButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action:  {
            
        }){
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

struct upload_Previews: PreviewProvider {
    static var previews: some View {
        updateView()
        .preferredColorScheme(.dark)
    }
}
