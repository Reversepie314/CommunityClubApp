//
//  CreateClub.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/31/24.
//

import SwiftUI

struct showClubView: View {
@EnvironmentObject var clubManagerVM: clubManager
    var body: some View {
        
        
        
        NavigationStack {
            NavigationLink("Create Profile", destination: {})
            
            
            ForEach(clubManagerVM.clubs, id: \.clubID) {
                
                club in
                
                Text("\(club.name)")
                Image("\(club.Image)")
                
            }
            
        }
    }
}

#Preview {
    showClubView()
        .environmentObject(clubManager())
}
