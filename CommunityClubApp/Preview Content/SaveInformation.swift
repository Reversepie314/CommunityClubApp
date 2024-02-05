//
//  SaveInformation.swift
//  CommunityClubApp
//
//  Created by Jaysin Myers on 2/2/24.
//

import Foundation
import SwiftData

@Model
class ClubCreation {
    var groupName: String
    var primaryInterest: String
    var secondaryInterest: String
    var mainGoal: String
    
    init(groupName: String, primaryInterest: String, secondaryInterest: String, mainGoal: String) {
        self.groupName = groupName
        self.primaryInterest = primaryInterest
        self.secondaryInterest = secondaryInterest
        self.mainGoal = mainGoal
    }
}
