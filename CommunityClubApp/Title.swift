//
//  Title.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/31/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Community Club")
            .font(.largeTitle)
        HStack {
            Text("Add a club")
            Image(systemName: "plus")
            
        }
    }
}

#Preview {
    Title()
}
