// HomeView.swift
// EpicSystems-Task

import Foundation
import SwiftUI

struct HomeView<ViewModel: HomeViewModelContract>: View {
    
    @StateObject var viewModel: ViewModel
    @State private var isFavoriteViewActive = false
    
    var body: some View {
        content
            .onAppear {viewModel.getPosts()}
            .overlay(emptyStateOverlay)
            .overlay(ErrorAlert(errorMessage: $viewModel.errorMessage))
            .overlay(LoadingOverlayView(isLoading: viewModel.shouldDisplayLoading))
            .refreshable { viewModel.refreshPosts() }
    }
}


extension HomeView {
    // MARK: - Main Navigation View
    var content: some View {
        NavigationStack {
            VStack {
                searchBar
                listOfPosts
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar { ToolbarItem(placement: .navigationBarTrailing) { favoriteButton } }
            .navigationDestination(isPresented: $isFavoriteViewActive) {
                FavoritePostsView(viewModel: viewModel)
            }
        }
    }
    
    
    
    // MARK: - BUTTON TO SHOW POSTS ADDED IN FAVORITE
    @ViewBuilder
    var favoriteButton: some View {
        Button(action: {
            isFavoriteViewActive = true
        }) {
            Image(systemName: "heart.fill")
                .foregroundStyle(Color.red)
        }
    }
    
    
    // MARK: - SEARCH IN POSTS VIEW
    @ViewBuilder
    var searchBar: some View {
        SearchBar(text: $viewModel.searchText)
    }
    
    
    
    // MARK: - LIST OF POSTS VIEW
    var listOfPosts: some View {
        ScrollableContent(
            orientation: .vertical,
            showsIndicators: false,
            items: viewModel.filteredPosts) { post in
                PostItemView(
                    post: post,
                    isSaved: viewModel.databasePosts.contains(where: { $0.id == post.id }),
                    saveAction: { post in viewModel.toggleFavorite(post) }
                )
                .opacity(viewModel.shouldDisplayLoading ? 0 : 1)
            }
            .padding(.top, 12)
            .animatedContent(value: viewModel.filteredPosts)
    }
    
    
    
    // MARK: - NO DATA PLACEHOLDER
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
