//
//  EpicSystems_TaskApp.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

@main
struct EpicSystems_TaskApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
