//
//  Message.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/12/24.
//

import Foundation

struct Message: Identifiable, Hashable {
    let id: UUID = UUID()
    let content: String
    let isCurrentUser: Bool
}
