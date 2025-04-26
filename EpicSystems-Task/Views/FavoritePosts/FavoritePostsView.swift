//
//  FavoriteView.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct FavoritePostsView<ViewModel: HomeViewModelContract>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        listOfPosts
            .navigationTitle(Localizable.Favorites.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    
    // MARK: - List Of Posts
    var listOfPosts: some View {
        ScrollableContent(
            orientation: .vertical,
            showsIndicators: false,
            items: viewModel.databasePosts) { post in
                PostItemView(
                    post: post,
                    isSaved: viewModel.databasePosts.contains(where: { $0.id == post.id }),
                    saveAction: { post in viewModel.toggleFavorite(post) }
                )
                .opacity(viewModel.shouldDisplayLoading ? 0 : 1)
            }
            .padding(.top, 12)
            .animatedContent(value: viewModel.databasePosts)

    }
}
