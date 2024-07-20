import SwiftUI
import SafariServices

var extensionBundleIdentifier = "com.bonjourr.bonjourrStartpage.Extension"

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
