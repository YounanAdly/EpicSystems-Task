//
//  NetworkService.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import Foundation
import Combine

final class NetworkService : NetworkServiceContract{
    
    static let shared: NetworkServiceContract = NetworkService()
    
    private let session: URLSession
    private let serviceQueue: DispatchQueue

    private init() {
        self.session = URLSession(configuration: .default)
        self.serviceQueue = DispatchQueue(
            label: "EpicSystemsTask.service",
            qos: .userInteractive,
            attributes: .concurrent
        )
    }

    func request<T: Decodable>(
        using request: RestRequest,
        responseType: T.Type,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, BaseError> {
        
        return Future<T, BaseError> { [weak self] promise in
            guard let self else {
                return promise(.failure(.unknown))
            }

            guard let url = URL(string: request.baseURL + request.path) else {
                return promise(.failure(.invalidURL))
            }

            do {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = request.method.rawValue
                urlRequest.allHTTPHeaderFields = request.headers
                urlRequest = try self.encodeParameters(for: urlRequest, method: request.method, parameters: request.parameters)

                self.performRequest(urlRequest, decoder: decoder, promise: promise)
            } catch {
                return promise(.failure(.invalidParameters))
            }
        }
        .receive(on: serviceQueue)
        .retry(3)
        .eraseToAnyPublisher()
    }

    private func performRequest<T: Decodable>(
        _ request: URLRequest,
        decoder: JSONDecoder,
        promise: @escaping (Result<T, BaseError>) -> Void
    ) {
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                let baseError = BaseError.underlying(error)
                return promise(.failure(baseError))
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let baseError = BaseError.httpError(statusCode)
                return promise(.failure(baseError))
            }

            guard let data = data else {
                return promise(.failure(.noData))
            }

            do {
                let decoded = try decoder.decode(T.self, from: data)
                promise(.success(decoded))
            } catch {
                promise(.failure(.decodingFailed(error)))
            }
        }.resume()
    }

    private func encodeParameters(
        for request: URLRequest,
        method: HttpMethod,
        parameters: [String: Any]?
    ) throws -> URLRequest {
        var request = request
        guard let parameters = parameters else { return request }

        switch method {
        case .get:
            if var components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false) {
                components.queryItems = parameters.map {
                    URLQueryItem(name: $0.key, value: "\($0.value)")
                }
                request.url = components.url
            }
        case .post, .put, .patch:
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        default:
            break
        }

        return request
    }
}
