import SwiftUI
import SafariServices

var extensionBundleIdentifier = "com.bonjourr.bonjourrStartpage.Extension"

// https://forums.developer.apple.com/forums/thread/719389
extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}

struct Logo: View {
    let height: CGFloat
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                Text("Bonjourr")
                    .font(.largeTitle)
                    .padding(8)
            }.frame(height: height)
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
