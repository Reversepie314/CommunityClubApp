// import SwiftUI
//
// 
//struct ChatMessage: Identifiable {
//    var id = UUID()
//    let content: String
//    let timestamp: Date
//}
//
// 
//struct ChatView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var messageText = ""
//    @State private var messages: [ChatMessage] = []
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(messages) { message in
//                    VStack(alignment: .leading) {
//                        Text(message.content)
//                            .padding()
//                        Text("\(message.timestamp, formatter: itemFormatter)")
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                    }
//                }
//                
//                HStack {
//                    TextField("Type a message...", text: $messageText) // Input field for new messages
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    Button("Send") {  
//                        sendMessage(content: messageText)
//                    }
//                }.padding()
//            }
//            .navigationBarTitle("Chat", displayMode: .inline) // Title for the chat view
//             
//        }
//    }
//
//    
//    private func sendMessage(content: String) {
//        let newMessage = ChatMessage(content: content, timestamp: Date()) // Create a new message instance
//        messages.append(newMessage) // Add the new message to the list
//        messageText = "" // Clear the input field after sending
//        
//        receiveRandomResponse()
//    }
//    
//     
//    private func receiveRandomResponse() {
//        let responses = [
//            "Hi, How can I help you?",
//            "Thank You for your assistance.",
//            "I'm doing okay, just a bit tired. How are you holding up?",
//            "I appreciate the help.",
//            "Let's have a study session.",
//            "Let's form a club.",
//            "Okay",
//            "Have a nice day.",
//            "Wayne State is awesome!"
//            
//        ]
//        
//        if let randomResponse = responses.randomElement() {
//            let responseMessage = ChatMessage(content: randomResponse, timestamp: Date().addingTimeInterval(1))
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.messages.append(responseMessage)
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .short
//    return formatter
//}()
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}


import SwiftUI

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var messageText = ""
    @State private var messages: [Message] = DataSource.messages

    var body: some View {
        NavigationView {
            VStack {
                List(messages) { message in
                    MessageCell(message: message)
                }
                
                HStack {
                    TextField("Type a message...", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Send") {
                        sendMessage(content: messageText)
                    }
                }.padding()
            }
            .navigationBarTitle("Chat", displayMode: .inline)
        }
    }

    private func sendMessage(content: String) {
        let newMessage = Message(content: content, isCurrentUser: true)
        messages.append(newMessage)
        messageText = ""
        
        // Simulate a reply
        receiveRandomResponse()
    }
    
    private func receiveRandomResponse() {
        let responses = [" Sure, what do you need help with?", "😂 That's hilarious!", "I totally agree.", "Have you tried restarting it?", "Let's meet up and discuss.", "Bye", "Hello, How can I help you"]
        if let randomResponse = responses.randomElement() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.messages.append(Message(content: randomResponse, isCurrentUser: false))
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
