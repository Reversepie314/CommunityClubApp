//
//  Main.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/30/24.
//

//import SwiftUI
//
//// ObservableObject to hold the shared color settings
//class ColorSettings: ObservableObject {
//    @Published var backgroundColor: Color = .white
//}
//
//struct MainPageView: View {
//    @StateObject var colorSettings = ColorSettings()
//
//    var body: some View {
//        TabView {
//            FirstView().environmentObject(colorSettings)
//                .tabItem {
//                    Label("Home", systemImage: "house.fill")
//                }
//
//            SecondView().environmentObject(colorSettings)
//                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass.circle.fill")
//                }
//
//            ThirdView().environmentObject(colorSettings)
//                .tabItem {
//                    Label("Favorites", systemImage: "heart.fill")
//                }
//
//            FourthView().environmentObject(colorSettings)
//                .tabItem {
//                    Label("Profile", systemImage: "person.crop.circle.fill")
//                }
//
//            ColorPickerView().environmentObject(colorSettings)
//                .tabItem {
//                    Label("Settings", systemImage: "slider.horizontal.3")
//                }
//        }
//    }
//}
//
//struct FirstView: View {
//    @EnvironmentObject var colorSettings: ColorSettings
//    
//    var body: some View {
//        ZStack {
//            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
//            VStack {
//                ScrollView(.horizontal){
//                    LazyHStack {
//                        Image("Rabbit")
//                            .resizable().scaledToFill().frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(Color.pink,lineWidth: 4)).shadow(radius:4)
//                        
//                        Image("Dream")
//                            .resizable().scaledToFill().frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(Color.orange,lineWidth: 4)).shadow(radius:4)
//                        
//                        // Additional circles or other views can be added here
//                    }
//                    .border(Color.black)
//                    .frame(height: 160)
//                }
//
//                ScrollView(.vertical) {
//                    LazyVStack {
//                        Image("KeonJ")
//                            .resizable().scaledToFill().frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(Color.pink,lineWidth: 4)).shadow(radius:4)
//                        
//                        Image("Dream")
//                            .resizable().scaledToFill().frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(Color.orange,lineWidth: 4)).shadow(radius:4)
//                        HStack {
//                            Rectangle()
//                                .frame(width: 15, height: 15).foregroundColor(.blue)
//                            Text("meme")
//                        }
//                        Rectangle()
//                            .frame(width: 15, height: 15).foregroundColor(.red)
//                        Rectangle()
//                            .frame(width: 150, height: 150).foregroundColor(.pink)
//                        Rectangle()
//                            .frame(width: 150, height: 150).foregroundColor(.orange)
//                    }
//                    .border(Color.black)
//                }
//            }
//        }
//    }
//}
//
//// Define SecondView, ThirdView, FourthView, and ColorPickerView as before
//
//struct SecondView: View {
//    @EnvironmentObject var colorSettings: ColorSettings
//    
//    var body: some View {
//        ZStack {
//            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
//            Text("Search View")
//        }
//    }
//}
//
//struct ThirdView: View {
//    @EnvironmentObject var colorSettings: ColorSettings
//    
//    var body: some View {
//        ZStack {
//            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
//            Text("Favorites View")
//        }
//    }
//}
//
//struct FourthView: View {
//    @EnvironmentObject var colorSettings: ColorSettings
//    
//    var body: some View {
//        ZStack {
//            colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
//            Text("Profile View")
//        }
//    }
//}
//
//// ColorPickerView for adjusting the background color
//struct ColorPickerView: View {
//    @EnvironmentObject var colorSettings: ColorSettings
//    
//    var body: some View {
//        VStack {
//            ColorPicker("Select Background Color", selection: $colorSettings.backgroundColor)
//                .padding()
//        }
//    }
//}
//
//struct MainPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPageView()
//    }
//}
