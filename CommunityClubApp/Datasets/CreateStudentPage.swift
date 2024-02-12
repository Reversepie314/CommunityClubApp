//
//  CreateStudentPage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/8/24.
//

import SwiftUI

struct CreateStudentView : View {
     
//    @EnvironmentObject var clubManagerVM: clubManager
    @State private var clubName = ""
    @State private var clubInterests = ""
    @State private var clubFacts = ""
    var body: some View {
        
        VStack{
            
            
            Text("Create Group")
//            Image(systemName:
            
            TextField("ClubName:", text: $clubName)
            TextField("ClubInterests:", text: $clubInterests)
            TextField("Interesting Fact:", text: $clubFacts)
    
            
            
            
            Button {
                
            } label: {
                Text("Add Student")
            }
            
             
            
            
            
        }
        
        
    }
}


#Preview {
    CreateStudentView()
         
        .environmentObject(clubManager())
    
}
