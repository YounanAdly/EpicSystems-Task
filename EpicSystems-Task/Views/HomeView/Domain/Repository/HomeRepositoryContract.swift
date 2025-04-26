// HomeRepositoryContract.swift
// EpicSystems-Task

import Foundation
import Combine

protocol HomeRepositoryContract {
    func getPosts() -> AnyPublisher<[PostsResponse], BaseError>
}
