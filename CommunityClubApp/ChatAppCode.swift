//
//  ChatAppCode.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/12/24.
//



import SwiftUI
import Combine

struct MessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor.systemGray6))
            .cornerRadius(10)
    }
}

struct MessageView: View {
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isCurrentUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            MessageCell(contentMessage: currentMessage.content, isCurrentUser: currentMessage.isCurrentUser)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

//struct ContentChatView: View {
//    @State var messages = DataSource.messages
//    @State var newMessage: String = ""
//    
//    var body: some View {
//        VStack {
//            ScrollViewReader { proxy in
//                ScrollView {
//                    LazyVStack {
//                        ForEach(messages, id: \.self) { message in
//                            MessageView(currentMessage: message)
//                                .id(message)
//                        }
//                    }
//                    .onReceive(Just(messages)) { _ in
//                        withAnimation {
//                            proxy.scrollTo(messages.last, anchor: .bottom)
//                        }
//                    }.onAppear {
//                        withAnimation {
//                            proxy.scrollTo(messages.last, anchor: .bottom)
//                        }
//                    }
//                }
//                
//                HStack {
//                    TextField("Send a message", text: $newMessage)
//                        .textFieldStyle(.roundedBorder)
//                    Button(action: sendMessage) {
//                        Image(systemName: "paperplane")
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//    
//    func sendMessage() {
//        if !newMessage.isEmpty {
//            messages.append(Message(content: newMessage, isCurrentUser: true))
//            messages.append(Message(content: "Reply of " + newMessage, isCurrentUser: false))
//            newMessage = ""
//        }
//    }
//}


#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: false))
}
