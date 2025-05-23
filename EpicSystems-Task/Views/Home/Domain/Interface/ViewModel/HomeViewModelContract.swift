// HomeViewModelContract.swift
// EpicSystems-Task

import Foundation
import SwiftUI

typealias HomeViewModelContract = HomeViewModelInput & HomeViewModelOutput


protocol HomeViewModelInput: ObservableObject {
    func getPosts()
    func refreshPosts()
    func savePost(_ post: PostsResponse)
    func toggleFavorite(_ post: PostsResponse)
}

protocol HomeViewModelOutput: ObservableObject {
    var navigationTitle: String { get }
    var shouldDisplayLoading: Bool { get }
    var listOfPosts: [PostsResponse] { get }
    var filteredPosts: [PostsResponse] { get }
    var databasePosts: [PostsResponse] { get }
    var errorMessage: String? { get set }
    var searchText: String { get set }
}
