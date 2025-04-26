//
//  BaseError.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

enum BaseError: Error {
    case unknown
    case invalidURL
    case invalidParameters
    case noData
    case decodingFailed(Error)
    case httpError(Int)
    case underlying(Error)
    case custom(message: String)
}
