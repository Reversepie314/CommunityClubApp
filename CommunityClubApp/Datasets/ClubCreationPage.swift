//
//  ClubCreationPage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/8/24.
//

import SwiftUI

struct createClub: View {
    
    // This method holds clubs/students/currently being created
    
    // This method hold all complte clubs
    @EnvironmentObject var clubManagerVM:clubManager
    var body: some View {
        NavigationStack {
            VStack{
                
                
                TextField("ClubName:", text: $clubManagerVM.createdClub.name)
                TextField("ClubImage:", text: $clubManagerVM.createdClub.Image)
                
                
                
                Button(action: {
                    
                    
                    clubManagerVM.addClub()
                    
                    
                }, label: {
                    Text("Button")
                })
                
                Text("\(clubManagerVM.createdClub.name)")
                
                
                
            }
            
            NavigationLink("Show Club View") {
                showClubView()
            }
            
        }
    }
}


#Preview {
    createClub()
         
        .environmentObject(clubManager())
    
}


