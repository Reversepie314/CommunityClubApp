 import SwiftUI

// Define a model for chat messages
struct ChatMessage: Identifiable {
    var id = UUID() // Unique identifier for each message
    let content: String // The text content of the message
    let timestamp: Date // The timestamp when the message was "sent"
}

// SwiftUI View for displaying and sending chat messages
struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode // For dismissing the view
    @State private var messageText = "" // The current input from the user
    @State private var messages: [ChatMessage] = [] // The list of messages in the chat

    var body: some View {
        NavigationView {
            VStack {
                List(messages) { message in
                    VStack(alignment: .leading) {
                        Text(message.content) // Display the message content
                            .padding()
                        Text("\(message.timestamp, formatter: itemFormatter)") // Display the formatted timestamp
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    TextField("Type a message...", text: $messageText) // Input field for new messages
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Send") { // Button to "send" a message
                        sendMessage(content: messageText)
                    }
                }.padding()
            }
            .navigationBarTitle("Chat", displayMode: .inline) // Title for the chat view
             
        }
    }

    // Function to send a message and simulate receiving a random response
    private func sendMessage(content: String) {
        let newMessage = ChatMessage(content: content, timestamp: Date()) // Create a new message instance
        messages.append(newMessage) // Add the new message to the list
        messageText = "" // Clear the input field after sending
        
        receiveRandomResponse() // Simulate receiving a random response
    }
    
    // Function to simulate receiving a random response without shuffling
    private func receiveRandomResponse() {
        let responses = [
            "Hi, How are you?",
            "Thank You for your assistance",
            "I'm doing okay, just a bit tired. How are you holding up?",
            "I appreciate the help.",
            "Let's have a study session.",
            "Let's form a club.",
            "Okay",
            "Have a nice day."
            
        ]
        
        if let randomResponse = responses.randomElement() {
            let responseMessage = ChatMessage(content: randomResponse, timestamp: Date().addingTimeInterval(1)) // Create a response message
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.messages.append(responseMessage) // Add the random response to the messages list
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
