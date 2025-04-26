//
//  PostsResponse.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

struct PostsResponse: Codable,Identifiable,Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
