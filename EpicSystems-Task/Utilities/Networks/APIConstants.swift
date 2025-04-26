//
//  APIConstants.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

enum APIConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    enum Endpoints {
        static let getPosts = "/posts"
    }

    enum Headers {
        static let json = ["Content-Type": "application/json"]
    }
}
