//
//  CreateStudentPage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/8/24.
//

import SwiftUI

struct createdStudentView : View {
     
    @EnvironmentObject var clubManagerVM: clubManager
    var body: some View {
        
        VStack{
            
            
            TextField("ClubName:", text: $clubManagerVM.createdStudent.name)
            TextField("ClubInterests:", text: $clubManagerVM.createdStudent.interests)
            TextField("Interesting Fact:", text: $clubManagerVM.createdStudent.interestInNote)
    
            
            
            
            Button(action: {
                
                
                clubManagerVM.addStudentToClub()
             
                
                
                 
                
                
            }, label: {
                Text("Add Student")
            })
            
             
            
            
            
        }
        
        
    }
}


#Preview {
    createdStudentView()
         
        .environmentObject(clubManager())
    
}
