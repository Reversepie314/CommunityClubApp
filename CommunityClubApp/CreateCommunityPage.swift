import SwiftUI

class ColorSettings: ObservableObject {
    @Published var backgroundColor: Color = .white
}

class UserProfile: ObservableObject {
    @Published var name: String = ""
    @Published var primaryInterest: String = ""
    @Published var secondaryInterest: String = ""
    @Published var otherInfo: String = ""
}

struct CreateCommunityPage: View {
    @StateObject var colorSettings = ColorSettings()
    @StateObject var userProfile = UserProfile()
    @State private var selectedTab = 1
    @State private var showingThirdViewSheet = false

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView(userProfile: userProfile).environmentObject(colorSettings)
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

            Button(action: {
                showingThirdViewSheet = true
            }) {
                EmptyView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
            .tag(4)
        }
        .sheet(isPresented: $showingThirdViewSheet) {
            ThirdView(isPresented: $showingThirdViewSheet)
        }
    }
}

struct FirstView: View {
    @EnvironmentObject var colorSettings: ColorSettings
    @ObservedObject var userProfile: UserProfile
    @State private var searchTextChat = ""
    @State private var searchTextActiveChat = ""
    @State private var chatImages = ["WayneImage", "WayneImage", "Wayne State Sports", "Sport"]
    @State private var activeChatImages = ["Nature", "Travel", "Food", "Tech"]

    var filteredChatImages: [String] {
        searchTextChat.isEmpty ? chatImages : chatImages.filter { $0.contains(searchTextChat) }
    }

    var filteredActiveChatImages: [String] {
        searchTextActiveChat.isEmpty ? activeChatImages : activeChatImages.filter { $0.contains(searchTextActiveChat) }
    }

    var body: some View {
        NavigationView {
            ZStack {
                colorSettings.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    TextField("Search Chats", text: $searchTextChat)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding()

                    HStack {
                        Text("Chat")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .padding(.leading)
                        Spacer()
                    }

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(filteredChatImages, id: \.self) { imageName in
                                NavigationLink(destination: Text("Destination for \(imageName)")) {
                                    HStack {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                                        Text(imageName)
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }

                    HStack {
                        Text("Active Chats")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .padding(.leading)
                        Spacer()
                    }

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(filteredActiveChatImages, id: \.self) { imageName in
                                NavigationLink(destination: Text("Adding to Active Chat \(imageName)")) {
                                    HStack {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.green, lineWidth: 2))
                                        Text("Active Chat \(imageName)")
                                        Spacer()
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
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
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        isPresented = false // Dismiss the sheet
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Text("Profile")
                        .font(.headline)
                    Spacer()
                }
                .padding()

                Divider()

                VStack(alignment: .leading, spacing: 15) {
                    Image(systemName: "person.crop.circle.fill") // Replace with actual profile image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()

                    TextField("Name", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Primary Interest", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Secondary Interest", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Other Info", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ColorPickerView: View {
    @EnvironmentObject var colorSettings: ColorSettings

    var body: some View {
        ColorPicker("Select Background Color", selection: $colorSettings.backgroundColor)
            .padding()
    }
}

struct CreateCommunityPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunityPage()
    }
}
