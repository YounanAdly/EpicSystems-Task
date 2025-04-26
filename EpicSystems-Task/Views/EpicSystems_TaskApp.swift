//
//  EpicSystems_TaskApp.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

@main
struct EpicSystems_TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
