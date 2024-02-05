//
//  ClubCreation.swift
//  CommunityClubApp
//
//  Created by Jaysin Myers on 2/2/24.
//

import SwiftUI
import SwiftData

struct CreateAClub: View {
    
    @Environment(\.modelContext) var context
    @State private var isShowingClubSheet = false
    @Query(sort: \ClubCreation.groupName) var groups: [ClubCreation]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groups) { group in
                    GroupCell(groups: group)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(groups[index])
                    }
                })
            }
            .navigationTitle("Create A Club")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingClubSheet) { AddClubCreation() }
            .toolbar {
                if !groups.isEmpty {
                    Button("New Club", systemImage: "plus") {
                        isShowingClubSheet = true
                    }
                }
            }
            .overlay {
                if groups.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Clubs", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Create a new club.")
                    }, actions: {
                        Button("Create Club") {isShowingClubSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
    
   // #Preview { ContentView() }
    
    struct GroupCell: View {
        
        let groups: ClubCreation
        
        var body: some View {
            VStack{
                HStack {
                    Text(groups.groupName)
                    Spacer()
                    Text(groups.primaryInterest)
                }
                Text(groups.secondaryInterest)
                Text(groups.mainGoal)
            }
        }
        
       
        
        struct UpdateExpenseSheet: View {
            @Environment(\.dismiss) private var dismiss
            @Bindable var club: ClubCreation
            
            var body: some View {
                NavigationStack {
                    Form {
                        TextField("Club Name", text: $club.groupName)
                        TextField("Your club's primary interest.", text: $club.primaryInterest)
                        TextField("Your club's secondary interest.", text: $club.secondaryInterest)
                        TextField("What is the main goal of your club?", text: $club.mainGoal)
                    }
                    .navigationTitle("Update Club")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Button("Done") { dismiss() }
                        }
                    }
                }
            }
        }
    }
}

struct AddClubCreation: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var groupName: String = ""
    @State private var primaryInterest: String = ""
    @State private var secondaryInterest: String = ""
    @State private var mainGoal: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Club Name", text: $groupName)
                TextField("Your club's primary interest.", text: $primaryInterest)
                TextField("Your club's secondary interest.", text: $secondaryInterest)
                TextField("What is the main goal of your club?", text: $mainGoal)
            }
            .navigationTitle("New Club")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let club = ClubCreation(groupName: groupName, primaryInterest: primaryInterest, secondaryInterest: secondaryInterest, mainGoal: mainGoal)
                        context.insert(club)
                        dismiss()
                    }
                }
            }
        }
    }
}
#Preview {
    CreateAClub()
}
