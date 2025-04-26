// HomeRepositoryContract.swift
// EpicSystems-Task

import Foundation
import Combine

protocol HomeRepositoryContract {
    func getPosts() -> AnyPublisher<[PostsResponse], BaseError>
    func fetchLocalPosts() throws -> [PostsResponse]
    func savePost(_ post: PostsResponse) throws
    func deletePost(_ post: PostsResponse) throws
}
