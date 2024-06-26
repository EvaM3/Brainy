//
//  TriviaGameApp.swift
//  TriviaGame
//

//

import SwiftUI

@main
struct BrainyApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
