//
//  dummiedata.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/12/24.
//

 
//import Foundation
//
//struct DataSource {
//    static let messages = [
//        Message(content: "Hi there!", isCurrentUser: true),
//        Message(content: "Hello! How can I assist you today?", isCurrentUser: false),
//        Message(content: "How are you doing?", isCurrentUser: true),
//        Message(content: "I'm just a computer program, so I don't have feelings, but I'm here and ready to help you with any questions or tasks you have. How can I assist you today?", isCurrentUser: false),
//        Message(content: "Tell me a joke.", isCurrentUser: true),
//        Message(content: "Certainly! Here's one for you: Why don't scientists trust atoms? Because they make up everything!", isCurrentUser: false),
//        Message(content: "How far away is the Moon from the Earth?", isCurrentUser: true),
//        Message(content: "The average distance from the Moon to the Earth is about 238,855 miles (384,400 kilometers). This distance can vary slightly because the Moon follows an elliptical orbit around the Earth, but the figure I mentioned is the average distance.", isCurrentUser: false)
//    ]
//}


import Foundation

struct DataSource {
    static let messages = [
        Message(content: "Hey! Are you going to the club meeting tonight?", isCurrentUser: false),
        Message(content: "Yeah, I'll be there. Any idea what we're discussing?", isCurrentUser: true),
        Message(content: "I heard we're planning a community service project. Sounds like a great opportunity to make an impact.", isCurrentUser: false),
        Message(content: "Definitely. I've got some thoughts on that. We'll talk more at the meeting.", isCurrentUser: true),
        Message(content: "By the way, did you get a chance to look at the project proposal for our group?", isCurrentUser: false),
        Message(content: "Still working on it, but I'll send over the draft soon. Could you review it for me?", isCurrentUser: true),
        Message(content: "Sure thing, happy to help. Also, are we on for studying this weekend?", isCurrentUser: false),
        Message(content: "Absolutely. Booked the study room for us on Saturday at 10. Sound good?", isCurrentUser: true),
        Message(content: "Perfect! Looking forward to both the meeting and our study session. Catch you later!", isCurrentUser: false),
        Message(content: "Great, see you then!", isCurrentUser: true)
    ]
}

