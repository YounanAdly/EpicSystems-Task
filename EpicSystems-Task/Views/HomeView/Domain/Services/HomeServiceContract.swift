// HomeServiceContract.swift
// EpicSystems-Task

import Foundation
import Combine

protocol HomeServiceContract {
    func getPosts() -> AnyPublisher<[PostsResponse], BaseError>
}
