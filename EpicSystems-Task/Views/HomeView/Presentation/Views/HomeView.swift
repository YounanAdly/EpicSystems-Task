// HomeView.swift
// EpicSystems-Task

import Foundation
import SwiftUI

struct HomeView<ViewModel: HomeViewModelContract>: View {
    
    @StateObject var viewModel: ViewModel
    @State private var isRefreshing = false
    
    var body: some View {
        content
            .onAppear {viewModel.getPosts()}
            .overlay(emptyStateOverlay)
            .overlay(ErrorAlert(errorMessage: $viewModel.errorMessage))
            .overlay(LoadingOverlayView(isLoading: viewModel.shouldDisplayLoading))
    }
}

extension HomeView {
    
    
    // MARK: - Main Navigation View
    var content: some View {
        NavigationView {
            listOfPosts
                .navigationTitle(viewModel.navigationTitle)
                .navigationBarTitleDisplayMode(.automatic)
            
        }
    }
    
    
    
    // MARK: - List Of Posts
    var listOfPosts: some View {
        ScrollableContent(
            orientation: .vertical,
            showsIndicators: false,
            items: viewModel.listOfPosts) { post in
                PostItemView(post: post)
                    .opacity(viewModel.shouldDisplayLoading ? 0 : 1) 
            }
            .padding(.top, 12)
            .animatedContent(value: viewModel.listOfPosts)
    }
    
    
    
    // MARK: - No Data Placeholder
    var emptyStateOverlay: some View {
        EmptyPlaceholderView(
            itemCount: viewModel.listOfPosts.count,
            message: Localizable.Alert.noData
        )
        .opacity(viewModel.shouldDisplayLoading ? 0 : 1)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
