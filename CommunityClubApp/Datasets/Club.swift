//
//  Classmodel.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/8/24.
//

import Foundation

struct Club: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    static let all: [Club] = ["Wayne State Connect", "Art Club", "Wayne State Sports", "Wayne State Help", "Wayne State Track", "Wayne State Swim","Wayne State Football"]
            .map { Club(imageName: $0, name: $0) }
}


struct Student {
    
    var name:String
    var interests:String
    var interestInNote:String
    var Image: String
    var clubRef:Int
    
}


class clubManager:ObservableObject {
    
    @Published var clubs:[Club] = []
    @Published var students:[Student] = []
//    @Published var createdClub:Club = Club(Image: "", name: "", DOE: Date(), clubID:Int.random(in: 1...1000))
@Published var createdStudent: Student = Student(name: "", interests: "", interestInNote: "", Image: "Photography", clubRef:0)

    
    
//    func addClub() {
//        clubs.append(createdClub)
//        createdClub = Club(Image: "", name: "", DOE: Date(), clubID: 0)
//    }
    
    
    func deleteClub() {
        
    }
    
    func addStudentToClub() {
        
        students.append(createdStudent)
        
        createdStudent = Student(name: "", interests: "", interestInNote: "", Image: "", clubRef: 0)
        
    }
    
    
    func deleteStudentFromClub() {}
    

}
                                           
                                         
                                           
                                           
 


