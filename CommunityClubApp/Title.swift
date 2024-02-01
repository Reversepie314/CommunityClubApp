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
                Image("TitleScreenImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Text("Community Club")
                        .font(.system(size: 50, weight: .medium, design: .rounded))                        /*.font(.largeTitle)*/
                        .foregroundColor(.white)
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
