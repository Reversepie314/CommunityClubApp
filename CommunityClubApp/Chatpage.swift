 

 
import SwiftUI

class UserProfile: ObservableObject {
    @Published var name: String = ""
    @Published var primaryInterest: String = ""
    @Published var secondaryInterest: String = ""
    @Published var otherInfo: String = ""
}

struct CreateCommunityPage: View {
    @StateObject var userProfile = UserProfile()
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView(userProfile: userProfile)
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
                .tag(1)

            SecondView()
                .tabItem {
                    Label("Add Note", systemImage: "plus.circle.fill")
                }
                .tag(2)

            ThirdView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
                .tag(3)
        }
    }
}

struct FirstView: View {
    @State var clubs = Club.all
    @ObservedObject var userProfile: UserProfile
    @State private var searchTextChat = ""
    @State private var searchTextActiveChat = ""
//    @State private var chatImages = ["Wayne State Connect", "Art Club", "Wayne State Sports", "Wayne State Help", "Wayne State Track", "Wayne State Swim","Wayne State Football"]
    @State private var activeChatImages = ["Squirrel Watching Club", "Late Night Movie Club", "Helping Freshman Club", "Bible Study Club"]
    
    var filteredClubs: [Club] {
        searchTextActiveChat.isEmpty ? clubs : clubs.filter { $0.name.contains(searchTextActiveChat) }
    }

    var filteredActiveChatImages: [String] {
        searchTextActiveChat.isEmpty ? activeChatImages : activeChatImages.filter { $0.contains(searchTextActiveChat) }
    }
    @State private var showCreateStudentPage = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search Chats", text: $searchTextChat)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding()
                    Button {
                        showCreateStudentPage = true
                    } label: {
                        Image(systemName: "plus")
                            .padding(9)
                    }
                }

                HStack {
                    Text("Chat")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .padding(.leading)
                    Spacer()
                }

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(filteredClubs) { club in
                            NavigationLink(destination: ChatView(/* parameters if needed */)) {
                                HStack {
                                    Image(club.imageName) // This requires actual images named accordingly in your assets
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                                    Text(club.name)
                                    Spacer()
                                }
                                .padding(.top, 1)
                                .navigationBarTitle("")
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
                            NavigationLink(destination: ChatView(/* parameters if needed */)) {
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.green, lineWidth: 2))
                                    Text(" \(imageName)")
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
            .sheet(isPresented: $showCreateStudentPage) {
                CreateStudentView(clubs: $clubs)
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        ZStack {
            Text("Second View Content")
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var clubManagerVM: clubManager

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Profile")
                    .font(.headline)
                Spacer()
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "person.crop.circle.fill")
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

             
        }
    }
}

struct CreateCommunityPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunityPage()
        
        .environmentObject(clubManager())

    }
}
