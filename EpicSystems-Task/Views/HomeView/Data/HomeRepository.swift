// HomeRepository.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeRepository :HomeRepositoryContract {
    
    // MARK: - PROPERTIES
    private let service: HomeServiceContract
    private let coreDataService: CoreDataServiceContract
    
    
    // MARK: - INIT
    init(
        service: HomeServiceContract = HomeService(),
        coreDataService: CoreDataServiceContract = CoreDataService.shared
    ) {
        self.service = service
        self.coreDataService = coreDataService
    }
    
    // MARK: - REPOSITORIES METHODS
    func getPosts() -> AnyPublisher<[PostsResponse], BaseError> {
        service.getPosts()
    }
    
    // MARK: - LOCAL DATABASE METHODS
    func fetchLocalPosts() throws -> [PostsResponse] {
        try coreDataService.fetchPosts()
    }
    
    func savePost(_ post: PostsResponse) throws {
        try coreDataService.savePost(post)
    }
    
    func deletePost(_ post: PostsResponse) throws {
        try coreDataService.deletePost(post)
    }
    
}


