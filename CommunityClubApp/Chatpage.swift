 

 
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

            ThirdView(userProfile: userProfile) // Correctly passing userProfile here
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

//                HStack {
//                    Text("Active Chats")
//                        .font(.system(size: 20, weight: .medium, design: .default))
//                        .padding(.leading)
//                    Spacer()
//                }

//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack {
//                        ForEach(filteredActiveChatImages, id: \.self) { imageName in
//                            NavigationLink(destination: ChatView(/* parameters if needed */)) {
//                                HStack {
//                                    Image(systemName: "person.crop.circle")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .clipShape(Circle())
//                                        .overlay(Circle().stroke(Color.green, lineWidth: 2))
//                                    Text(" \(imageName)")
//                                    Spacer()
//                                    Image(systemName: "plus.circle.fill")
//                                        .foregroundColor(.blue)
//                                }
//                                .padding(.horizontal)
//                            }
//                        }
//                    }
//                }
            }
            .sheet(isPresented: $showCreateStudentPage) {
                CreateStudentView(clubs: $clubs)
            }
        }
        
    }
}

struct SecondView: View {
    @State private var messageText = ""
    @State private var savedNotes: [String] = []
    
    var body: some View {
        VStack {
            Text("Notes Page")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            
            
            
            ZStack {
                TextField("Add a note", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                HStack {
                    Spacer()
                    Button(action: {
                        saveNote()
                    }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding()
            
            List {
                ForEach(savedNotes, id: \.self) { note in
                    Text(note)
                }
                .onDelete(perform: deleteNote)
            }
        }
        .padding()
    }
    
    private func saveNote() {
        guard !messageText.isEmpty else { return }
        savedNotes.append(messageText)
        messageText = ""
    }
    
    private func deleteNote(at offsets: IndexSet) {
        savedNotes.remove(atOffsets: offsets)
    }
}


struct ThirdView: View  {
    @ObservedObject var userProfile: UserProfile
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Profile")
                    .font(.largeTitle).fontWeight(.bold)
                    .padding(.bottom, 5);                Spacer()
            }
            .padding()
            Divider()
            
            VStack(spacing: 15) {
                
                Image("TimScott")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, -20) // Adjust this value to move the image up or down
                    .padding()
                
                
                
                
                
                
                
                Divider()
                Text("Name: Tim Scott \(userProfile.name)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 0)
                Divider()
                Text("Primary Interest: Loves Cooking \(userProfile.primaryInterest)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 0)
                Divider()
                Text("Secondary Interest: Traveling \(userProfile.secondaryInterest)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 0)
                Divider()
                Text("Other Info: Spending time with family. \(userProfile.otherInfo)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 0)
                Divider()
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
    

