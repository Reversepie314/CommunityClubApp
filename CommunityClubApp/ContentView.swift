//
//  ContentView.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/26/24.
//

//import SwiftUI
//import SwiftData
//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("TitleScreenImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Text("Community Club")
                        .font(.system(size: 50, weight: .medium, design: .rounded))//.background(Color.green)                        /*.font(.largeTitle)*/
                        .foregroundColor(.white)
                        .padding()

                    NavigationLink(destination: SearchPage()) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#Preview {
    ContentView()
}
