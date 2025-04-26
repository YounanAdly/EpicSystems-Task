// HomeUseCase.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeUseCase :HomeUseCaseContract {

    // MARK: - PROPERTIES
    private let repository: HomeRepositoryContract
    
    // MARK: - INIT
    init(repository: HomeRepositoryContract = HomeRepository()) {
        self.repository = repository
    }
    
    // MARK: - USECASE METHODS
    func excuteGetPosts() -> AnyPublisher<[PostsResponse], BaseError> {
        repository.getPosts()
    }
    
    func excuteSavePost(_ post: PostsResponse) throws {
        try repository.savePost(post)
    }
    
    func excuteLocalPosts() throws -> [PostsResponse] {
        try repository.fetchLocalPosts()
    }
    
    func excuteDeletePost(_ post: PostsResponse) throws {
        try repository.deletePost(post)
    }
}
