//
//  NewAccountsScreen.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/2/24.
//

//import SwiftUI
//
//struct SearchPage: View {
//    @State private var searchText = ""
//    @State private var searchResults: [String] = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"] // Placeholder for search results
//
//    var body: some View {
//        VStack {
//            // Search Bar
//            TextField("Search...", text: $searchText)
//                .padding(10)
//                .background(Color(.systemGray5))
//                .cornerRadius(10)
//                .padding(.horizontal, 10)
//                .onChange(of: searchText) { newValue in
//                    // Logic to update search results based on searchText
//                    if newValue.isEmpty {
//                        searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"]
//                    } else {
//                        searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"].filter { $0.contains(newValue) }
//                    }
//                }
//            
//            Spacer().frame(height: 30) // Increased space between the search bar and the images
//            
//            Text("Join Chats")
//                .font(.title)
//                .fontWeight(.bold)
//                .padding(.bottom, 10)
//
//            // Image grid
//            let gridItems = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
//            LazyVGrid(columns: gridItems, spacing: 20) {
//                ForEach(0..<4, id: \.self) { index in
//                    NavigationLink(destination: CreateProfilePage()) {
//                        Image("WayneImage")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 150, height: 150)
//                            .background(Color(.systemGray6)) // Background to highlight rounded corners
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                    }
//                }
//            }
//            .padding([.horizontal, .bottom])
//
//            Spacer() // Ensures that the grid and search bar are pushed towards the top
//        }
//        .navigationBarTitle("Search", displayMode: .inline)
//    }
//}
//
//struct SearchPage_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            SearchPage()
//        }
//    }
//}


//import SwiftUI
//
//struct SearchPage: View {
//    @State private var searchText = ""
//    @State private var searchResults = ["WayneImage", "Photography", "Wayne State Help", "ArtClub"]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Search...", text: $searchText)
//                    .padding()
//                    .background(Color.gray.opacity(0.3))
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                    .onChange(of: searchText, perform: updateSearchResults)
//
//                Spacer().frame(height: 20)
//
//                Text("Join Chats")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.bottom)
//
//                imageGrid
//
//                Spacer()
//            }
//            .navigationBarTitle("Search", displayMode: .inline)
//        }
//    }
//
//    private func updateSearchResults(for value: String) {
//        if value.isEmpty {
//            searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"]
//        } else {
//            searchResults = ["chatImage1", "chatImage2", "chatImage3", "chatImage4"].filter { $0.contains(value) }
//        }
//    }
//
//    private var imageGrid: some View {
//        let gridItems = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
//        return LazyVGrid(columns: gridItems, spacing: 20) {
//            ForEach(searchResults, id: \.self) { imageName in
//                NavigationLink(destination: CreateProfilePage()) {
//                    Image(imageName)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 150, height: 150)
//                        .background(Color.gray.opacity(0.3))
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                }
//            }
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct SearchPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchPage()
//    }
//}


import SwiftUI

// Define a struct to hold image and text information
struct ImageTextPair: Identifiable, Hashable {
    let id = UUID()
    var imageName: String
    var text: String
}

struct SearchPage: View {
    @State private var searchText = ""
    @State private var allImageTextPairs = [
        ImageTextPair(imageName: "Wayne State Connect", text: "Wayne Connect"),
        ImageTextPair(imageName: "Art Club", text: "Art Club"),
        ImageTextPair(imageName: "Photography", text: "Photography"),
        ImageTextPair(imageName: "Wayne State Sports", text: "Sports Club")
    ]
    
    // Derived state for filtered or all pairs
    private var filteredImageTextPairs: [ImageTextPair] {
        if searchText.isEmpty {
            return allImageTextPairs
        } else {
            return allImageTextPairs.filter { $0.text.contains(searchText) || $0.imageName.contains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Spacer().frame(height: 20)

                Text("Join Chats")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)

                imageGrid

                Spacer()
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
        .navigationBarBackButtonHidden(true)
    }

    private var imageGrid: some View {
        let gridItems = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
        return LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(filteredImageTextPairs) { pair in
                NavigationLink(destination: CreateProfilePage()) {
                    VStack {
                        Image(pair.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                        
                        Text(pair.text)
                            .font(.caption)
                            .padding([.top, .bottom], 4)
                    }
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
            }
        }
        .padding(.horizontal)
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
