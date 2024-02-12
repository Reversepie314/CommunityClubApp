//
//  Message.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/12/24.
//

import Foundation

struct Message: Hashable {
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
}
