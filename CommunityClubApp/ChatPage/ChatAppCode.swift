
import SwiftUI

struct MessageCell: View {
    var message: Message
    @EnvironmentObject var chatManagerVM:DataSource
    
    var body: some View {
        HStack {
            if !message.isCurrentUser {
                Spacer()
            }
            Text(message.content)
                .padding(10)
                .foregroundColor(message.isCurrentUser ? Color.white : Color.black)
                .background(message.isCurrentUser ? Color.blue : Color.gray.opacity(0.5))
                .cornerRadius(10)
            if message.isCurrentUser {
                Spacer()
            }
        }
        .transition(.slide)
        .animation(.default)
    }
}

struct MessageView: View {
    var messages: [Message]
    
    var body: some View {
        ForEach(messages) { message in
            MessageCell(message: message)
        }
    }
}
