// HomeViewModelContract.swift
// EpicSystems-Task

import Foundation
import SwiftUI

typealias HomeViewModelContract = HomeViewModelInput & HomeViewModelOutput


protocol HomeViewModelInput: ObservableObject {
    func getPosts()
    func refreshPosts()
}

protocol HomeViewModelOutput: ObservableObject {
    var navigationTitle: String { get }
    var shouldDisplayLoading: Bool { get }
    var listOfPosts: [PostsResponse] { get }
    var errorMessage: String? { get set }
}
