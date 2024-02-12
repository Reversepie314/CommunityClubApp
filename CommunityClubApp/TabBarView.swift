//
//  TabBarView.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/5/24.
//

import SwiftUI

struct TabBarView: View {
  //  @StateObject var colorSettings = ColorSettings()
    @StateObject var userProfile = UserProfile()
    @State private var selectedTab = 1
    @State private var showingThirdViewSheet = false

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                
                FirstView(userProfile: userProfile)//.environmentObject(colorSettings)
                    .tabItem {
                        Label("Chats", systemImage: "message.fill")
                    }
                    .tag(1)
                
                SecondView()//.environmentObject(colorSettings)
                    .tabItem {
                        Label("Add Note", systemImage: "plus.circle.fill")
                    }
                    .tag(2)
                
                ThirdView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                    .tag(3)
                
//                Button(action: {
//                    showingThirdViewSheet = true
//                }) {
//                    Label("Profile", systemImage: "person.crop.circle.fill")
//                }
//                .tabItem {
//                    Label("Profile", systemImage: "person.crop.circle.fill")
//                }
//                .tag(4)
            }
//            .sheet(isPresented: $showingThirdViewSheet) {
//                ThirdView(isPresented: $showingThirdViewSheet)
                    
            }
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }

#Preview {
    TabBarView()
}
