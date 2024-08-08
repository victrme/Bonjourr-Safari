
import SwiftUI
import SafariServices

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Logo(height: 140)
                
                Button("Safari extension preferences") {
                    openSafariSettings()
                }
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Instructions")
                    .font(.title)
                
                Text("Here is how to manually enable Bonjourr on Safari MacOS:")
                
                VStack(alignment: .leading, spacing: 15) {
                    InstructionStep(number: 1, text: "Open Safari settings window by going to Safari > Settings... or pressing CMD + ,.")
                    
                    InstructionStep(number: 2, text: "In the settings, go to the Extensions tab, and enable Bonjourr Startpage.")
                    
                    InstructionStep(number: 3, text: "Lastly, back to the General tab, verify that 'New tabs open:' and 'New windows open:' are set to Bonjourr - Minimalist Startpage")
                    
                    Spacer(minLength: 20)
                }
                
                VStack(alignment: .center, spacing: 16) {
                    Screenshot(name: "macos-1", text: "Status bar after opening Safari")
                 
                    Screenshot(name: "macos-2", text: "Safari settings window, Extensions tab")
                    
                    Screenshot(name: "macos-3", text: "General Safari settings")
                }
            }
            .padding(32)
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
                .frame(width: 600, height: 400)
        }
        .windowResizabilityContentSize()
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified)
    }
}

// funcs

func openSafariSettings() {
    SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
        guard error == nil else {
            // Insert code to inform the user that something went wrong.
            return
        }
        
        DispatchQueue.main.async {
            NSApplication.shared.terminate(nil)
        }
    }
}

func checkEnabledStateMacOS() -> Bool {
    var isEnabled = false
    
    SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { (state, error) in
        guard let state = state, error == nil else {
            // Insert code to inform the user that something went wrong.
            return
        }
        
        isEnabled = state.isEnabled
    }
    
    return isEnabled
}
