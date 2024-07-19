import SwiftUI
import SafariServices


var extensionBundleIdentifier = "com.bonjourr.bonjourrStartpage.Extension"

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    Image("Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text("Bonjourr")
                        .font(.largeTitle)
                }.frame(width: .infinity, height: 100)
                
                #if os(macOS)
                Button("Safari extension preferences") {
                    openSafariSettings()
                }
                .padding()
                .foregroundColor(.white)
                .cornerRadius(8)
                #endif
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Instructions")
                    .font(.title)
                
                #if os(macOS)
                Text("Here is how to manually enable Bonjourr on Safari MacOS:")
                
                VStack(alignment: .leading, spacing: 15) {
                    InstructionStep(number: 1, text: "Open Safari settings window by going to Safari > Settings... or pressing CMD + ,.")
                    Image("macos-1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                    
                    InstructionStep(number: 2, text: "In the settings, go to the Extensions tab, and enable Bonjourr Startpage.")
                    Image("macos-2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                    
                    InstructionStep(number: 3, text: "Lastly, back to the General tab, verify that 'New tabs open:' and 'New windows open:' are set to Bonjourr - Minimalist Startpage")
                    Image("macos-3")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                    
                }
                #endif
                
                #if os(iOS)
                Text("Here is how to manually enable Bonjourr on Safari iOS:")

                VStack(alignment: .leading, spacing: 20) {
                    InstructionStep(number: 1, text: "Open settings > Safari > Extensions > Bonjourr * Minimalist Startpage")
                    Image("ios-1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(16)
                    
                    InstructionStep(number: 2, text: "Select Bonjourr * Minimalist Startpage for the option 'Open new tabs with'")
                    Image("ios-2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(16)
            
                    
                }
                #endif
            }
            .padding()
        }
    }
}

struct InstructionStep: View {
    let number: Int
    let text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(number).")
                .font(.headline)
                .padding(.trailing, 5)
            Text(text)
        }
    }
}

func openSafariSettings() {
    #if os(macOS)
        SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
            guard error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }
            
            DispatchQueue.main.async {
                NSApplication.shared.terminate(nil)
            }
        }
    #endif
}

func checkEnabledStateMacOS() -> Bool {
    var isEnabled = false
    
    #if os(macOS)
        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { (state, error) in
            guard let state = state, error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }

            
            isEnabled = state.isEnabled
        }
    #endif
    
    return isEnabled
}

#Preview {
    ContentView()
}
