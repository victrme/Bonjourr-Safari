import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL
    
    private func openSettings() {
        openURL(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    var body: some View {
        ScrollView {
            Logo()
            
            HStack() {
                Button("Open Settings", systemImage: "gear", action: openSettings)
                .foregroundColor(.white)
                .cornerRadius(8)
                
            }.frame(minHeight: 300)
        
            VStack(alignment: .leading, spacing: 20) {
                Text("Instructions")
                    .font(.title)
                
                Text("Here is how to enable Bonjourr on Safari iOS:")
                
                VStack(alignment: .leading, spacing: 20) {
                    InstructionStep(number: 1, text: "Open settings > Safari > Extensions > Bonjourr * Minimalist Startpage")
                    
                    InstructionStep(number: 2, text: "Select Bonjourr * Minimalist Startpage for the option 'Open new tabs with'")
                    
                    InstructionStep(number: 3, text: "Open Safari iOS, Bonjourr should appear on every new tabs")
                }
                
                VStack(spacing: 20) {
                    Screenshot(name: "ios-1", text: "Settings > Safari > Extensions > Bonjourr")
                  
                    Screenshot(name: "ios-2", text: "Open with Bonjourr")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

@main
struct bonjourrStartpageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

