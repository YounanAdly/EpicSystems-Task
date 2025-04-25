//
//  RestRequest.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

struct RestRequest {
    let baseURL: String
    let path: String
    let method: HttpMethod
    let headers: [String: String]
    let parameters: [String: Any]?
}
