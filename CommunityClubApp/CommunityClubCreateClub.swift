//import SwiftUI
//
// 
//struct CreateCommunityPage2: View {
//    @StateObject var colorSettings = ColorSettings()
//    @State private var selectedTab = 1
//    @State private var showingThirdViewSheet = false
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//             
//            Text("First Tab Content")
//                .tabItem {
//                    Label("Tab 1", systemImage: "house.fill")
//                }
//                .tag(1)
//
//          
//            Text("Second Tab Content")
//                .tabItem {
//                    Label("Tab 2", systemImage: "plus.circle.fill")
//                }
//                .tag(2)
//
//            
//            Text("Third Tab Content")
//                .tabItem {
//                    Label("Tab 3", systemImage: "slider.horizontal.3")
//                }
//                .tag(3)
//
//             
//            Text("Fourth Tab Content")
//                .tabItem {
//                    Label("Tab 4", systemImage: "person.crop.circle.fill")
//                }
//                .tag(4)
//        }
//        .onChange(of: selectedTab) { newTab in
//            if newTab == 4 {
//                showingThirdViewSheet = true
//                selectedTab = 1
//            }
//        }
//        .sheet(isPresented: $showingThirdViewSheet) {
//             
//            Text("Sheet Content")
//        }
//    }
//}
//
//struct CreateCommunityPage2_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateCommunityPage2()
//    }
//}
