//
//  CloudKitUser.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/30/24.
//

//import SwiftUI
//import CloudKit
//
//class CloudKitUserViewModel: ObservableObject {
//    let container = CKContainer.default()
//    lazy var database = contianer.publicCloudDatabase
//    
//    @Published var permissionStatus: Bool = false
//    @Published var isSignedInToiCloud: Bool = false
//    @Published var error: String = ""
//    @Published var userName: String = ""
//    
//    init() {
//        requestPermission()
////        fetchiCloudUserRecordID()
//    }
//    
//    enum CloudKitError: String, LocalizedError {
//        case iCloudAccountNotFound
//        case iCloudAccountNotDetermined
//        case iCloudAccountRestricted
//        case iCloudAccountUnknown
//    }
//    // TODO: handle other statuses.
//    func requestPermission() async throws {
//        let status = try await container.accountStatus()
//        switch status {
//        case .couldNotDetermine:
//            self.error = CloudKitError.iCloudAccountNotDetermined.rawValue
//        case .available:
//            isSignedInToiCloud = true
//        case .restricted:
//            self.error = CloudKitError.iCloudAccountRestricted.rawValue
//        case .noAccount:
//            self.error = CloudKitError.iCloudAccountNotFound.rawValue
//        case .temporarilyUnavailable:
//            self.error = CloudKitError.iCloudAccountUnknown.rawValue
//        @unknown default:
//            break
//        }
//    }
//    
//    func fetchiCloudUserRecordID() async throws {
//        userName = try await container.userRecordID().recordName
//    }
//    
//    func discoveriCloudUser(id: CKRecord.ID) {
//        container.user
//        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
//            DispatchQueue.main.async {
//                if let name = returnedIdentity?.nameComponents?.givenName {
//                    self?.userName = name
//                    
//                }
//                
//            }
//        }
//        
//    }
//    
//}
//
//
//struct CloudKitUser: View {
//    
//    @StateObject private var vm = CloudKitUserViewModel()
//    
//    var body: some View {
//        VStack {
//            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
//            Text(vm.error)
//            Text("Permission: \(vm.permissionStatus.description.uppercased())"
//            Text("NAME: \(vm.userName)")
//        }
//    }
//}
//
//#Preview {
//    CloudKitUser()
//}
