//
//  Title.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/31/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("TitleScreenImage") // Background image
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Makes the image cover the full screen

                VStack {
                    Spacer() // Pushes content to the center
                    Text("Community Club")
                        .font(.largeTitle)
                        .foregroundColor(.white) // Change text color for better visibility
                        .padding()

                    NavigationLink(destination: CreateCommunityPage()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer() // Pushes content to the center
                }
            }
        }
    }
}

//struct CreateCommunityPage: View {
//    var body: some View {
//        Text("This is the Create Community Page")
//    }
//}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
#Preview {
    Title()
}
