//
//  CreateCommunityPage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/31/24.
//

//import SwiftUI
//
//struct CreateCommunityPage: View {
//    
//    @State private var showSheet = false
//    @State private var nameOfClub = ""
//    @State private var interest = ""
//    @State private var hobbies = ""
//
//    var body: some View {
//        VStack {
//            Button("Create") {
//                showSheet = true
//            }
//            .sheet(isPresented: $showSheet) {
//                NavigationView {
//                    Form {
//                        Section(header: HStack {
//                            Text("Club Information")
//                            Spacer()
//                            Button(action: {
//                                showSheet = false
//                            }) {
//                                Image(systemName: "x.circle.fill")
//                                    .foregroundColor(Color.gray)
//                            }
//                        }) {
//                            TextField("Name of Club", text: $nameOfClub)
//                            TextField("Interest", text: $interest)
//                            TextField("Hobbies", text: $hobbies)
//                        }
//                    }
//                    .navigationBarHidden(true)
//                }
//            }
//        }
//    }
//}
//
//struct CreateCommunityPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateCommunityPage()
//    }
//}


import SwiftUI

 
class ColorSettings: ObservableObject {
    @Published var backgroundColor: Color = .white
}

struct CreateCommunityPage: View {
    @StateObject var colorSettings = ColorSettings()
    @State private var selectedTab = 1
    @State private var showingThirdViewSheet = false

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView().environmentObject(colorSettings)
                .tabItem {
                    Label("Notes", systemImage: "house.fill")
                }
                .tag(1)

            SecondView().environmentObject(colorSettings)
                .tabItem {
                    Label("Search", systemImage: "plus.circle.fill")
                }
                .tag(2)

            ColorPickerView().environmentObject(colorSettings)
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                }
                .tag(3)

            Button(action: {}) {
                EmptyView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
            .tag(4)
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == 4 {
                showingThirdViewSheet = true
                selectedTab = 1 // Reset to the first tab after presenting the sheet
            }
        }
        .sheet(isPresented: $showingThirdViewSheet) {
            ThirdView(isPresented: $showingThirdViewSheet)
                .environmentObject(colorSettings)
        }
    }
        
}

struct FirstView: View {
    @EnvironmentObject var colorSettings: ColorSettings

    var body: some View {
        ZStack {
            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
            Text("First View Content")
        }
    }
     }

struct SecondView: View {
    @EnvironmentObject var colorSettings: ColorSettings

    var body: some View {
        ZStack {
            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
            Text("Second View Content")
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var colorSettings: ColorSettings
    @Binding var isPresented: Bool
    @State private var nameOfClub = ""
    @State private var interest = ""
    @State private var hobbies = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: HStack {
                    Text("Club Information")
                    Spacer()
                    Button(action: {
                        isPresented = false // Dismiss the sheet
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.gray)
                    }
                }) {
                    TextField("Name of Club", text: $nameOfClub)
                    TextField("Interest", text: $interest)
                    TextField("Hobbies", text: $hobbies)
                    
                    
                    
                    
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
     }

struct ColorPickerView: View {
    @EnvironmentObject var colorSettings: ColorSettings

    var body: some View {
        VStack {
            ColorPicker("Select Background Color", selection: $colorSettings.backgroundColor)
                .padding()
        }
    }
}

struct CreateCommunityPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunityPage()
    }
}
