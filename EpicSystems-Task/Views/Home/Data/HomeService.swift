// HomeService.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeService :HomeServiceContract {
    
    // MARK: - Properties
    private let service: NetworkServiceContract
    
    // MARK: - Init
    init(service: NetworkServiceContract = NetworkService.shared) {
        self.service = service
    }
    
    // MARK: - SERVICE METHODS
    func getPosts() -> AnyPublisher<[PostsResponse], BaseError> {
        let request = RestRequest(
            baseURL: APIConstants.baseURL,
            path: APIConstants.Endpoints.getPosts,
            method: .get,
            headers: APIConstants.Headers.json,
            parameters: nil)
        
         return service
             .request(using: request, responseType: [PostsResponse].self)
     }
}
