//
//  FruitAppApp.swift
//  FruitApp
//
//  Created by Mehdi Oturak on 22.10.2024.
//

import SwiftUI

@main
struct FruitAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
