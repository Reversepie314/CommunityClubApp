//
//  CreateStudentPage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/8/24.
//

//import SwiftUI
//
//struct CreateStudentView : View {
//     
//    @Environment(\.dismiss) var dismiss
////    @EnvironmentObject var clubManagerVM: clubManager
//    @State private var clubName = ""
//    @State private var clubInterests = ""
//    @State private var clubFacts = ""
//    @Binding var clubs: [Club]
//    var body: some View {
//        
//        VStack{
//            
//            
//            Text("Create Group")
//                .font(.largeTitle)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .padding(.bottom, 150)
//   
//            
//            TextField("Club Name:", text: $clubName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom, 20)
//            
//            
//            TextField("Club Interests:", text: $clubInterests)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom, 20)
//            
//            TextField("Brief Description:", text: $clubFacts)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom, 20)
//    
//            
//            
//            
//            Button {
//                clubs.append(Club(imageName: clubName, name: clubName))
//                clubs.sort { $0.name < $1.name }
//                dismiss()
//            } label: {
//                Text("Create club")
//            }
//            
//             
//            
//            
//            
//        }
//        
//        
//    }
//}
//
//
//#Preview {
//    CreateStudentView(clubs: .constant([]))
//         
//    
//}


import SwiftUI
import UIKit // Ensure UIKit is imported for UIImage

struct CreateStudentView: View {
    @Environment(\.dismiss) var dismiss
    @State private var clubName = ""
    @State private var clubInterests = ""
    @State private var clubFacts = ""
    @Binding var clubs: [Club]
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var profileImage: Image = Image(systemName: "person.crop.circle.fill") // Default profile image

    var body: some View {
        VStack {
            Text("Create Group")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack {
                profileImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: $inputImage)
                    }
            }

            TextField("Club Name:", text: $clubName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            TextField("Club Interests:", text: $clubInterests)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            TextField("Brief Description:", text: $clubFacts)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            Button {
                clubs.append(Club(imageName: clubName, name: clubName))
                clubs.sort { $0.name < $1.name }
                dismiss()
            } label: {
                Text("Create Club")
            }
        }
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            picker.dismiss(animated: true)
        }
    }
}

// Preview for CreateStudentView
struct CreateStudentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStudentView(clubs: .constant([]))
    }
}
