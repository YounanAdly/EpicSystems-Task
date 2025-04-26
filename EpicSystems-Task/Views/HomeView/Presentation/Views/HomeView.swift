// HomeView.swift
// EpicSystems-Task

import Foundation
import SwiftUI


struct HomeView<ViewModel: HomeViewModelContract>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.listOfPosts) { item in
                    // TODO POST ITEM VIEW
                }
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            // TODO Toolbar Favorite Button
        }
        .overlay(ErrorAlert(errorMessage: $viewModel.errorMessage))
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
