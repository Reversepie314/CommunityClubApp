//
//  CreateProfilePage.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 2/2/24.
//

 

//import SwiftUI
//
//struct CreateProfilePage: View {
//    @State private var name: String = ""
//    @State private var primaryInterest: String = ""
//    @State private var funFacts: String = ""
//    @State private var formCompleted = false
//    @State private var showingAlert = false
//    @State private var showingImagePicker = false
//    @State private var inputImage: UIImage?
//    @State private var profileImage: Image = Image(systemName: "person.crop.circle.fill") // Default profile image
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 45) {
//                Text("Create a Profile")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                
//                profileImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .padding(.bottom, 20)
//                    .onTapGesture {
//                        showingImagePicker = true
//                    }
//                    .accessibilityLabel("Profile picture")
//                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//                        ImagePicker(image: $inputImage)
//                    }
//                
//                TextField("Enter your name", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.bottom, 10)
//                
//                TextField("Enter your primary interest", text: $primaryInterest)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.bottom, 10)
//                
//                TextField("Share something interesting", text: $funFacts)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.bottom, 20)
//
//                 
//                NavigationLink(destination: TabBarView(), isActive: $formCompleted) {
//                    Button(action: {
//                        self.formCompleted = true
//                    }) {
//                        HStack {
//                            Spacer()
//                            Text("Join Club")
//                            Image(systemName: "arrow.right")
//                            Spacer()
//                        }
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    }
//                    .disabled(!formCompleted)
//                }
//                
//                .onChange(of: name) { _ in validateForm() }
//                .onChange(of: primaryInterest) { _ in validateForm() }
//                .onChange(of: funFacts) { _ in validateForm() }
//            }
//            .padding()
//            .alert("Profile Created", isPresented: $showingAlert) {
//                Button("OK", role: .cancel) { }
//            } message: {
//                Text("Welcome to the club! Your profile has been successfully created.")
//            }
//            .navigationBarTitle("Create Profile", displayMode: .inline)
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//
//    private func loadImage() {
//        guard let inputImage = inputImage else { return }
//        profileImage = Image(uiImage: inputImage)
//    }
//
//    private func validateForm() {
//        formCompleted = !name.isEmpty && !primaryInterest.isEmpty && !funFacts.isEmpty
//    }
//}
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.image = uiImage
//            }
//
//            picker.dismiss(animated: true)
//        }
//    }
//}
//
// 
//
//struct CreateProfilePage_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateProfilePage()
//    }
//}
//
//
//
// 

import SwiftUI

struct CreateProfilePage: View {
    @State private var name: String = ""
    @State private var primaryInterest: String = ""
    @State private var funFacts: String = ""
    @State private var formCompleted = false
    @State private var showingAlert = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var profileImage: Image = Image(systemName: "person.crop.circle.fill") // Default profile image

    var body: some View {
        NavigationView {
              // Wrap content in ScrollView
                VStack(alignment: .leading, spacing: 30) {
                    Text("Add Picture")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.bottom, 20)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                        .accessibilityLabel("Profile picture")
                        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                            ImagePicker(image: $inputImage)
                        }
                    ScrollView {                    TextField("Enter your name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                        
                        TextField("Enter your primary interest", text: $primaryInterest)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                        
                        TextField("Share something interesting", text: $funFacts)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                    }
                    // NavigationLink is now used to trigger navigation when formCompleted becomes true
                    NavigationLink(destination: CreateCommunityPage(), isActive: $formCompleted) {
                        Button(action: {
                            self.validateForm()
                        }) {
                            HStack {
                                Spacer()
                                Text("Join Club")
                                Spacer()
                            }
                        }
                        .padding()
                        .background(formCompleted ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .disabled(!formCompleted)
                    }
                
                .padding()
                .onChange(of: name) { _ in validateForm() }
                .onChange(of: primaryInterest) { _ in validateForm() }
                .onChange(of: funFacts) { _ in validateForm() }
            }
            .alert("Profile Created", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Welcome to the club! Your profile has been successfully created.")
            }
            .navigationBarTitle("Create Profile", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }

    private func validateForm() {
        formCompleted = !name.isEmpty && !primaryInterest.isEmpty && !funFacts.isEmpty
        if formCompleted {
            showingAlert = true
        }
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

struct CreateProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfilePage()
    }
}
