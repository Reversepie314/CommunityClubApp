//
//  ChatView.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/5/24.
//


//import SwiftUI
//
//// Define a model for chat messages
//struct ChatMessage: Identifiable {
//    var id = UUID() // Unique identifier for each message
//    let content: String // The text content of the message
//    let timestamp: Date // The timestamp when the message was "sent"
//}
//
//// SwiftUI View for displaying and sending chat messages
//struct ChatView: View {
//    @Environment(\.presentationMode) var presentationMode // For dismissing the view
//    @State private var messageText = "" // The current input from the user
//    @State private var messages: [ChatMessage] = [] // The list of messages in the chat
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(messages) { message in
//                    VStack(alignment: .leading) {
//                        Text(message.content) // Display the message content
//                            .padding()
//                        Text("\(message.timestamp, formatter: itemFormatter)") // Display the formatted timestamp
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                    }
//                }
//                
//                HStack {
//                    TextField("Type a message...", text: $messageText) // Input field for new messages
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    Button("Send") { // Button to "send" a message
//                        sendMessage(content: messageText)
//                    }
//                }.padding()
//            }
//            .navigationBarTitle("Chat", displayMode: .inline) // Title for the chat view
//            .navigationBarItems(leading: Button("Back") { // Custom "Back" button
//                self.presentationMode.wrappedValue.dismiss() // Dismiss the view
//            })
//        }
//    }
//
//    // Function to send a message and simulate receiving a random response
//    private func sendMessage(content: String) {
//        let newMessage = ChatMessage(content: content, timestamp: Date()) // Create a new message instance
//        messages.append(newMessage) // Add the new message to the list
//        messageText = "" // Clear the input field
//        
//        receiveRandomResponse() // Simulate receiving a random response
//    }
//    
//    // Function to simulate receiving a random response with shuffling for variety
//    private func receiveRandomResponse() {
//        var responses = [
//            "Interesting point!",
//            "I never thought about it that way.",
//            "Could you elaborate on that?",
//            "That's a great perspective.",
//            "Let's discuss this more."
//        ]
//        
//        responses.shuffle() // Shuffle the responses array
//        let randomResponse = responses.first ?? "Let's talk!" // Take the first element of the shuffled array
//        
//        let responseMessage = ChatMessage(content: randomResponse, timestamp: Date().addingTimeInterval(1)) // Create a response message
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.messages.append(responseMessage) // Add the random response to the messages list
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

//import SwiftUI
//
//// Define a model for chat messages
//struct ChatMessage: Identifiable {
//    var id = UUID() // Unique identifier for each message
//    let content: String // The text content of the message
//    let timestamp: Date // The timestamp when the message was "sent"
//}
//
//// SwiftUI View for displaying and sending chat messages
//struct ChatView: View {
//    @Environment(\.presentationMode) var presentationMode // For dismissing the view
//    @State private var messageText = "" // The current input from the user
//    @State private var messages: [ChatMessage] = [] // The list of messages in the chat
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(messages) { message in
//                    VStack(alignment: .leading) {
//                        Text(message.content) // Display the message content
//                            .padding()
//                        Text("\(message.timestamp, formatter: itemFormatter)") // Display the formatted timestamp
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                    }
//                }
//                
//                HStack {
//                    TextField("Type a message...", text: $messageText) // Input field for new messages
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    Button("Send") { // Button to "send" a message
//                        sendMessage(content: messageText)
//                    }
//                }.padding()
//            }
//            .navigationBarTitle("Chat", displayMode: .inline) // Title for the chat view
//            // Removed the .navigationBarItems(leading: Button("Back") { ... }) line here
//        }
//    }
//
//    // Function to send a message and simulate receiving a random response
//    private func sendMessage(content: String) {
//        let newMessage = ChatMessage(content: content, timestamp: Date()) // Create a new message instance
//        messages.append(newMessage) // Add the new message to the list
//        messageText = "" // Clear the input field
//        
//        receiveRandomResponse() // Simulate receiving a random response
//    }
//    
//    // Function to simulate receiving a random response with shuffling for variety
//    private func receiveRandomResponse() {
//        var responses = [
//            "Interesting point!",
//            "I never thought about it that way.",
//            "Could you elaborate on that?",
//            "That's a great perspective.",
//            "Let's discuss this more.",
//            "Could you tell when class starts again"
//        ]
//        
//        responses.shuffle() // Shuffle the responses array
//        let randomResponse = responses.first ?? "Let's talk!" // Take the first element of the shuffled array
//        
//        let responseMessage = ChatMessage(content: randomResponse, timestamp: Date().addingTimeInterval(1)) // Create a response message
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.messages.append(responseMessage) // Add the random response to the messages list
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
    
    // Function to simulate receiving a random response with shuffling for variety
    private func receiveRandomResponse() {
        var responses = [
            "Interesting point!",
            "I never thought about it that way.",
            "Could you elaborate on that?",
            "That's a great perspective.",
            "Let's discuss this more.",
            "Could you tell when class starts again",
            "I'm good, just caught up in a mountain of assignments lately.",
            "Doing well, thanks! I've been exploring some new hobbies.",
            "That's an interesting point. I hadn't considered it from that angle.",
            "I'm part of that club. The next meeting should be interesting.",
            "I'm on the lookout for book suggestions if you have any.",
            "I've been thinking a lot about my major and future career paths.",
            "I joined a new workout class. It's been a great stress reliever.",
            "I'm trying to improve my cooking skills. Experimented with a new recipe last night.",
            "I've been focusing on mindfulness and meditation lately.",
            "I'm planning a small road trip for the break. Really excited about it.",
            "I attended a really inspiring lecture yesterday.",
            "I'm working on a group project. It's challenging but rewarding.",
            "I'm looking forward to this weekend's event. Should be fun.",
            "I've been catching up on some much-needed sleep.",
            "I'm trying out a new study technique. So far, so good.",
            "I'm exploring some volunteer opportunities.",
            "I'm excited about the upcoming holiday. Need a break.",
            "I've been getting into podcasting. Found some really good ones.",
            "I'm working on a personal project. It's a work in progress.",
            "I'm thinking about what classes to take next semester.",
            "I'm good, just been busy with assignments. How about you?",
            "Doing well, thanks! Caught up on some reading. You?",
            "I'm intrigued by that topic. Can you share more details?",
            "I've heard about that class. What's it like?",
            "Yeah, I'm part of that club. Do you know when the next meeting is?",
            "I'm looking for a new book to dive into. Any recommendations?",
            "That sounds interesting. Where can I find more info?",
            "I've been thinking about joining a study group. Know any?",
            "I'm trying to get better at managing my time. Any tips?",
            "I'm curious about your major. Why did you choose it?",
            "I'm considering studying abroad. Got any advice?",
            "I need a break from studying. Got any plans this weekend?",
            "I'm looking forward to the holiday break. What are your plans?",
            "I'm feeling a bit overwhelmed. How do you deal with stress?",
            "I'm trying to find a good place to study on campus. Any suggestions?",
            "I'm thinking about getting involved in research. Know where to start?",
            "I'm good, just looking forward to the weekend. How's your week been?",
            "Doing well, just staying on top of my coursework. How's your semester going?",
            "I'm interested in that event. Do you know where it's being held?",
            "I'm doing okay, just a bit tired. How are you holding up?"

            
            
            
        ]
        
        responses.shuffle() // Shuffle the responses array
        let randomResponse = responses.first ?? "Let's talk!" // Take the first element of the shuffled array
        
        let responseMessage = ChatMessage(content: randomResponse, timestamp: Date().addingTimeInterval(1)) // Create a response message
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.messages.append(responseMessage) // Add the random response to the messages list
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
