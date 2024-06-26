


import SwiftUI

struct ImageTextPair: Identifiable, Hashable {
   let id = UUID()
   var imageName: String
   var text: String
}

struct SearchImageView: View {
   @State private var searchText = ""
   @State private var allImageTextPairs = [
       ImageTextPair(imageName: "Wayne State Connect", text: "Pizza"),
       ImageTextPair(imageName: "Art Club", text: "Art Club"),
       ImageTextPair(imageName: "Photography", text: "Photography"),
       ImageTextPair(imageName: "Wayne State Sports", text: "Sports Club")
   ]
   
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
                   .background(Color.gray.opacity(0.1)) // Lighter background for better contrast
                   .cornerRadius(10)
                   .padding(.horizontal)
                   .overlay(
                       RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.gray, lineWidth: 1)
                   ) // Adding a border
               
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
       let gridItems = Array(repeating: GridItem(.flexible(), spacing:10 ), count: 4)
       return LazyVGrid(columns: gridItems, spacing: 20) {
           ForEach(filteredImageTextPairs) { pair in
               NavigationLink(destination:  NavigationLinkSearch()) {
                   
                   VStack {
                       Image(pair.imageName)
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 80, height: 80)
                       

                   
                       Text(pair.text)
                           
                          .font(.caption)
//                          .padding(1)
//                           .padding([.top, .bottom], 0.2)
                            
                       
                       
                       
                   }
                   .background(Color.white) // Adjusted for better contrast
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .shadow(radius: 5) // Adding shadow for depth
                   
               }
               
               NavigationLink(destination:  NavigationLinkSearch()) {
                   
                   VStack {
                       Image(pair.imageName)
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 80, height: 80)
                       

                   
                       Text(pair.text)
                           .font(.caption)
                           .padding([.top, .bottom], 4)
                   }
                   .background(Color.white) // Adjusted for better contrast
                   .clipShape(RoundedRectangle(cornerRadius: 20))
                   .shadow(radius: 5) // Adding shadow for depth
                   
               }
               NavigationLink(destination: 
    NavigationLinkSearch()) {
                   
                   VStack {
                       Image(pair.imageName)
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 80, height: 80)
                       

                   
                       Text(pair.text)
                           .font(.caption)
                           .padding([.top, .bottom], 1)
                           
                   }
                   .background(Color.white) // Adjusted for better contrast
                   .clipShape(RoundedRectangle(cornerRadius: 20))
                   .shadow(radius: 5) // Adding shadow for depth
                   
               }

               
               
               
               
               
               
               
               
               
               
               
               
               
               
           }
       }
       .padding(.horizontal)
   }
}

struct SearchPage_Previews: PreviewProvider {
   static var previews: some View {
       SearchImageView()
   }
}
