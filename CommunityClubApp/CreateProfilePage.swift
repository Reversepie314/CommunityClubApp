//
//  CreateProfilePage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/2/24.
//

 

import SwiftUI

struct CreateProfileView: View {
    @State private var name: String = ""
    @State private var primaryInterest: String = ""
    @State private var funFact: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Primary Interest", text: $primaryInterest)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Fun Fact", text: $funFact)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(destination: CreateCommunityPage()) {
                    Text("Join Chat")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .navigationBarBackButtonHidden(true)
                
                
                .padding()
                .onDisappear {
                    saveProfileData()
                }

                Spacer()
            }
            .navigationTitle("Create Profile")
            .navigationBarHidden(true)
        }
    }

    private func saveProfileData() {
        UserDefaults.standard.set(name, forKey: "profileName")
        UserDefaults.standard.set(primaryInterest, forKey: "profilePrimaryInterest")
        UserDefaults.standard.set(funFact, forKey: "profileFunFact")
    }
    
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
