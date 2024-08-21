import SwiftUI
import SafariServices

var extensionBundleIdentifier = "com.bonjourr.bonjourrStartpage.Extension"

// https://forums.developer.apple.com/forums/thread/719389
extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, iOS 17.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}

struct Logo: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                
                VStack(alignment: .leading) {
                    Text("Bonjourr")
                        .font(.system(size: 32))
                        .fontWeight(.medium)
                    
                    Text("Minimalist and lightweight startpage")
                }
                .padding()
            }
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

struct Screenshot: View {
    let name: String
    let text: String
    
    var body: some View {
        VStack() {
            Image(name)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .padding(16)
            
            Text(text)
                .font(.caption)
                .italic()
        }
    }
}
