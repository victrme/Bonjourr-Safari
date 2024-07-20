import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            Logo(height: 100)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Instructions")
                    .font(.title)
                
              
                Text("Here is how to enable Bonjourr on Safari iOS:")

                VStack(alignment: .leading, spacing: 20) {
                    InstructionStep(number: 1, text: "Open settings > Safari > Extensions > Bonjourr * Minimalist Startpage")
                    
                    InstructionStep(number: 2, text: "Select Bonjourr * Minimalist Startpage for the option 'Open new tabs with'")
                   
                    InstructionStep(number: 3, text: "Open Safari iOS, Bonjourr should appear on every new tabs")
                    
                    Spacer(minLength: 20)
                   
                    Image("ios-1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(8)
                    
                    
                    Text("Settings > Safari > Extensions > Bonjourr")
                        .font(.caption)
                        .italic()
                    
                    Spacer(minLength: 20)
                 
                    Image("ios-2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(8)
                    
                    Text("Open with Bonjourr")
                        .font(.caption)
                        .italic()
                    
                    Spacer(minLength: 20)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
