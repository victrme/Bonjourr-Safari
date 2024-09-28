
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
                        .foregroundColor(.accentColor)
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
                        
                        Text("Open Safari. In the status bar, select")
                        
                        Text("Safari")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 2)
                            .background(Color("BackgroundColor"))
                            .foregroundColor(.primary)
                            .cornerRadius(6)
                        
                        Text("then")
                        
                        Text("Settings...       ⌘,")
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                    }
                    
                    HStack {
                        Text("2.")
                            .font(.headline)
                            .padding(.trailing, 5)
                        
                        Text("Once the settings opened, go to")
                        codeLabel(text: "Extensions", label: "puzzlepiece.extension")
                    }
                    
                    HStack {
                        Text("3.")
                            .font(.headline)
                            .padding(.trailing, 5)
                        
                        Text("On the left menu, enable")
                        codeLabel(text: "Bonjourr • Minim...", label: "cloud.sun")
                    }
                    
                    HStack {
                        Text("4.")
                            .font(.headline)
                            .padding(.trailing, 5)
                        
                        Text("Go back to the")
                        codeLabel(text: "General", label: "gearshape")
                        Text("tab")
                    }
                    
                    HStack {
                        Text("5.")
                            .font(.headline)
                            .padding(.trailing, 5)
                        
                        Text("Verify that \"New tabs\" and \"New windows\" open")
                        
                        codeLabel(text: "Bonjourr • Minim...", label: "cloud.sun")
                    }
                    
                    Spacer(minLength: 20)
                    
                    Text("Screenshots")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
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

struct codeLabel: View {
    let text: String
    let label: String
    
    var body: some View {
        Label(text, systemImage: label)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color("BackgroundColor"))
            .foregroundColor(Color("AccentColor"))
            .cornerRadius(6)
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
