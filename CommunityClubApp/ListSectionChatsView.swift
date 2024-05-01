//
//  ListSectionChatsView.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/14/24.
//

import SwiftUI

struct ListSectionChatsView: View {
    var body: some View {
        List{
           Section("Active Chats") {
                Text("Bible Study Group")
            }
            
            Section("Other Chats") {
            HStack{
                Image(systemName: "star.fill")
                Text("Wayne State Squirrel Feeding Club")
            }
            }
        }
    }
}

#Preview {
    ListSectionChatsView()
}
