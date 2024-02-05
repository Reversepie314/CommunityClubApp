//
//  CreateProfilePage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/2/24.
//

import SwiftUI

// Assuming CreateCommunityPage is defined in your project as shown previously

struct CreateProfilePage: View {
    @State private var name: String = ""
    @State private var primaryInterest: String = ""
    @State private var funFacts: String = ""
    
    var body: some View {
        NavigationView { // Embedding NavigationView here for the standalone view
            VStack(alignment: .leading, spacing: 20) {
                Text("Create a Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                
                Text("Name")
                    .font(.headline)
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Primary Interest")
                    .font(.headline)
                TextField("Enter your primary interest", text: $primaryInterest)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("A Few Fun Facts About Me")
                    .font(.headline)
                TextField("Share something interesting", text: $funFacts)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                
                NavigationLink(destination: TabBarView()) {
                    HStack {
                        Spacer()
                        Text("Next")
                        Image(systemName: "arrow.right")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CreateProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfilePage() // Preview already wrapped in NavigationView within CreateProfilePage
    }
}
