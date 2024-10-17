import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL
    
    private func openSettings() {
        openURL(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Logo().frame(maxWidth: 330)
                
                HStack() {
                    Link("Homepage", destination: URL(string: "https://bonjourr.fr")!)
                        .font(.subheadline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .foregroundStyle(Color(uiColor: .label))
                        .background(Color(uiColor: .secondarySystemFill))
                        .cornerRadius(8)
                    
                    Link("Documentation", destination: URL(string: "https://bonjourr.fr/docs")!)
                        .font(.subheadline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .foregroundStyle(Color(uiColor: .label))
                        .background(Color(uiColor: .secondarySystemFill))
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .frame(minHeight: 300)
            .padding()
            
            HStack() {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Instructions")
                        .font(.title)
                    
                    Text("In Settings, these are the buttons you have to click to enable Bonjourr on Safari iOS: ")
                    
                    VStack(alignment: .leading, spacing: 8) {
                        settingsButton(labelText: "Apps", labelIcon:"apps.iphone", iconText: "", iconIcon: "chevron.right")
                        settingsButton(labelText: "Safari", labelIcon: "safari.fill", iconText: "", iconIcon: "chevron.right")
                        settingsButton(labelText: "Extensions", labelIcon: "", iconText: "", iconIcon: "chevron.right")
                        settingsButton(labelText: "Bonjourr • Minim...", labelIcon:"cloud.sun", iconText: "Off", iconIcon: "chevron.right")
                        settingsButton(labelText: "Allow Extension", labelIcon:"", iconText: "", iconIcon: "")
                        settingsButton(labelText: "Open New Tabs", labelIcon:"", iconText: "On Start Page", iconIcon: "chevron.right")
                        settingsButton(labelText: "Bonjourr • Minim...", labelIcon:"cloud.sun", iconText: "", iconIcon: "checkmark")
                    }
                    .padding()
                    
                    Text("After these steps, you can start using Bonjour by opening a new tab on Safari !")
                  
                }
                .padding(20)
                .padding(.top, 12)
                .padding(.bottom, 24)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(20)
                
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

struct settingsButton: View {
    let labelText: String
    let labelIcon: String
    let iconText: String
    let iconIcon: String
    
    var body: some View {
        HStack() {
            if labelIcon != "" {
                Image(systemName: labelIcon)
                    .symbolRenderingMode(.hierarchical)
            }
            
            Text(labelText)
                .frame(maxWidth: .infinity, alignment: .leading)
              
            Text(iconText)
                .foregroundStyle(.gray)
            
            if iconIcon != "" {
                Image(systemName: iconIcon)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
            }
               
        }
        .padding(12)
        .background(Color(.iOSButtonsBackground))
        .cornerRadius(8)
    }
}
