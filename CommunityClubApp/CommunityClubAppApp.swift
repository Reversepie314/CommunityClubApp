//
//  CommunityClubAppApp.swift
//  CommunityClubApp
//
//  Created by Keon Johnson on 1/26/24.
//

import SwiftUI
import SwiftData

@main
struct CommunityClubAppApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
       //     CloudKitUser()
            ContentView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
