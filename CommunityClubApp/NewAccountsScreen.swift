//
//  NewAccountsScreen.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/2/24.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText = ""
    @State private var searchResults: [String] = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"] // Placeholder for search results

    var body: some View {
        VStack {
            // Search Bar
            TextField("Search...", text: $searchText)
                .padding(10)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .onChange(of: searchText) { newValue in
                    // Logic to update search results based on searchText
                    if newValue.isEmpty {
                        searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"]
                    } else {
                        searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"].filter { $0.contains(newValue) }
                    }
                }
            
            Spacer().frame(height: 30) // Increased space between the search bar and the images
            
            Text("Join Chats")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            // Image grid
            let gridItems = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(0..<4, id: \.self) { index in
                    NavigationLink(destination: CreateProfilePage()) {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .background(Color(.systemGray6)) // Background to highlight rounded corners
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
            .padding([.horizontal, .bottom])

            Spacer() // Ensures that the grid and search bar are pushed towards the top
        }
        .navigationBarTitle("Search", displayMode: .inline)
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchPage()
        }
    }
}
