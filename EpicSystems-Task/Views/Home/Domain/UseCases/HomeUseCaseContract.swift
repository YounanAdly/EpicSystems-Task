// HomeUseCaseContract.swift
// EpicSystems-Task

import Foundation
import Combine

protocol HomeUseCaseContract {
    func excuteGetPosts() -> AnyPublisher<[PostsResponse], BaseError>
    func excuteSavePost(_ post: PostsResponse) throws
    func excuteLocalPosts() throws -> [PostsResponse]
    func excuteDeletePost(_ post: PostsResponse) throws
}
