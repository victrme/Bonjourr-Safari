
import SwiftUI
import SafariServices

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 40) {
                Logo()
            
                VStack(alignment: .center, spacing: 22) {
                    
                    if !checkEnabledStateMacOS() {
                        Label("Bonjourr is currently running. You can close this window and open a new tab.", systemImage: "checkmark.circle")
                        
                        Button("Close window") {
                            NSApplication.shared.terminate(nil)
                        }
                        .foregroundColor(.white)
                        .cornerRadius(8)
                     
                    } else {
                        Label("Bonjourr is not currently running, follow the instructions below if needed.", systemImage: "xmark.circle")
                        
                        Button("Open Safari preferences") {
                            openSafariSettings()
                        }
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                }.frame(width: 280)
                
            }.frame(minHeight: 300)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Instructions")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Text("Here is how to manually enable Bonjourr on Safari MacOS:")
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Text("1.")
                            .font(.headline)
                            .padding(.trailing, 5)
                        
                        Text("Open Safari settings window by going to ") +
                        Text("Safari > Settings...")
                    }
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
        isEnabled = state?.isEnabled ?? false
    }
    
    return isEnabled
}
