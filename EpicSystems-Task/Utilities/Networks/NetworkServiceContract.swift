//
//  NetworkServiceContract.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import Foundation
import Combine

protocol NetworkServiceContract {
    func request<T: Decodable>(
        using request: RestRequest,
        responseType: T.Type,
        decoder: JSONDecoder
    ) -> AnyPublisher<T, BaseError>
}

extension NetworkServiceContract {
    func request<T: Decodable>(
        using request: RestRequest,
        responseType: T.Type = T.self
    ) -> AnyPublisher<T, BaseError> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: .init()
        )
    }
}
