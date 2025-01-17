//
//  iCMPApp.swift
//  iCMP
//
//  Created by  유 주연 on 8/13/24.
//

import SwiftUI
import SwiftData

@main
struct iCMPApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ClipboardContent.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
          MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
