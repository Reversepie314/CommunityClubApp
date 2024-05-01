//
//  Message.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/12/24.
//

import Foundation

//struct Message: Identifiable, Hashable {
//    static func == (lhs: Message, rhs: Message) -> Bool {
//        <#code#>
//    }
//    
//    let id: UUID = UUID()
//    let content: String
//    let student: Student
//}


struct Message: Identifiable, Hashable, Equatable {
let id: UUID = UUID()
let content: String
let student: Student
let isCurrentUser:Bool

// Implement Equatable conformance
static func == (lhs: Message, rhs: Message) -> Bool {
    return lhs.id == rhs.id
        && lhs.content == rhs.content
        && lhs.student == rhs.student
}

// Implement Hashable conformance
func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(content)
    hasher.combine(student)
}
}
