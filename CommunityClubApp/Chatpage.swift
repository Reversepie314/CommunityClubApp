 

 
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

import SwiftUI
import PhotosUI

// Assuming Club and UserProfile are defined in your model
struct FirstView: View {
    @State var clubs = Club.all
    @ObservedObject var userProfile: UserProfile
    @State private var searchTextChat = ""
    @State private var searchTextActiveChat = ""
    @State private var activeChatImages = ["Squirrel Watching Club", "Late Night Movie Club", "Helping Freshman Club", "Bible Study Club"]
    @State private var showCreateStudentPage = false
    @State private var showAddPhoto = false
    @State private var selectedImage: UIImage?
    
    

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Chats").font(.headline)) {
                    TextField("Search Chats", text: $searchTextChat)
                        .padding(.vertical, 8)
                        .listRowBackground(Color(.systemGray6))
                    
                    ForEach(filteredClubs) { club in
                        NavigationLink(destination: ChatView()) {
                            ChatRow(club: club)
                        }
                    }
                    Button(action: {
                        showCreateStudentPage = true
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add New Chat")
                        }
                    }
                }
                
                Section(header: Text("Active Chats").font(.headline)) {
                    ForEach(filteredActiveChatImages, id: \.self) { imageName in
                        NavigationLink(destination: ChatView()) {
                            ActiveChatRow(imageName: imageName, image: selectedImage)
                        }
                    }
                    Button(action: {
                        showAddPhoto = true
                    }) {
                        HStack {
                            Image(systemName: "camera")
                            Text("Add Photo to Chat")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Clubs & Chats")
            .toolbar {
                Button(action: {
                    showCreateStudentPage = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showCreateStudentPage) {
                // CreateStudentView placeholder
                CreateStudentView(clubs:$clubs)
            }
            .sheet(isPresented: $showAddPhoto) {
                ImagePicker2(selectedImage: $selectedImage, sourceType: .photoLibrary)
            }
        }
    }
    
    var filteredClubs: [Club] {
        searchTextChat.isEmpty ? clubs : clubs.filter { $0.name.contains(searchTextChat) }
    }
    
    var filteredActiveChatImages: [String] {
        searchTextActiveChat.isEmpty ? activeChatImages : activeChatImages.filter { $0.contains(searchTextActiveChat) }
    }
}

struct ChatRow: View {
    var club: Club
    
    var body: some View {
        HStack {
            Image(club.imageName) // Assuming imageName is a valid asset
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
            Text(club.name)
            Spacer()
        }
    }
}

struct ActiveChatRow: View {
    var imageName: String
    var image: UIImage?
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.green, lineWidth: 2))
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.green, lineWidth: 2))
            }
            Text(imageName)
            Spacer()
        }
    }
}

struct ImagePicker2: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker2
        
        init(_ parent: ImagePicker2) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}
//
//
//// Assume Club and UserProfile are defined elsewhere, as well as ChatView and CreateStudentView
 
///
///
///
///

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
                .environmentObject(DataSource())

        }
    }
    

