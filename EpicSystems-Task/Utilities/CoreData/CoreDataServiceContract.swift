//
//  CoreDataServiceContract.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

protocol CoreDataServiceContract {
    func savePost(_ post: PostsResponse) throws
    func fetchPosts() throws -> [PostsResponse]
    func deletePost(_ post: PostsResponse) throws
}
