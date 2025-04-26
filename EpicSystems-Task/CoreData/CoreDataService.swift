//
//  CoreDataService.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import CoreData

class CoreDataService: CoreDataServiceContract {
    
    static let shared = CoreDataService()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "EpicSystems_Task")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    // MARK: - SAVE POST
    func savePost(_ post: PostsResponse) throws {
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        let existingPosts = try context.fetch(fetchRequest)
        
        if existingPosts.isEmpty {
            let savedPost = Post(context: context)
            savedPost.id = Int64(post.id)
            savedPost.userId = Int64(post.userId)
            savedPost.title = post.title
            savedPost.body = post.body
            try context.save()
            print("Post \(post.id) saved")
        } else {
            print("Post \(post.id) already exists in Core Data")
        }
    }

    
    
    // MARK: - FETCH ALL SAVED POSTS
    func fetchPosts() throws -> [PostsResponse] {
        let context = container.viewContext
        let request = NSFetchRequest<Post>(entityName: "Post")
        let posts = try context.fetch(request)
        return posts.map { post in
            PostsResponse(
                userId: Int(post.userId),
                id: Int(post.id),
                title: post.title ?? "",
                body: post.body ?? ""
            )
        }
    }
    
    
    
    // MARK: - DELETE POST FROM DATABASE
    func deletePost(_ post: PostsResponse) throws {
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        let existingPosts = try context.fetch(fetchRequest)
        
        if let postToDelete = existingPosts.first {
            context.delete(postToDelete)
            try context.save()
            print("Post \(post.id) deleted from Core Data")
        } else {
            print("Post \(post.id) not found in Core Data")
        }
    }
}
