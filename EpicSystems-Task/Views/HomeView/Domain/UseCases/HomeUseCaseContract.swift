// HomeUseCaseContract.swift
// EpicSystems-Task

import Foundation
import Combine

protocol HomeUseCaseContract {
    func excuteGetPosts() -> AnyPublisher<[PostsResponse], BaseError>
}
