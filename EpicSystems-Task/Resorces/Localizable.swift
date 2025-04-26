//
//  Localizable.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

enum Localizable {
    
    enum Favorites {
        static let navigationTitle = "Favorites"
    }
    
    enum Home {
        static let navigationTitle = "list of posts"
    }
    
    enum APIS {
        static let requestFinishedSuccessfully = "Request finished successfully"
        static let requestFailedWithError = "Request failed with error: "
    }
    
    enum Alert {
        static let errorTitle = "Error"
        static let unknownError = "An unknown error occurred"
        static let okButton = "OK"
        static let noData = "No Data available."
    }
    
    enum CoreData {
        static let fetchPostsFromCoreData = "Fetched %d posts from Core Data"
        static let failedToFetchPosts = "Failed to fetch posts: %@"
        static let failedToDeletePost = "Failed to delete post: %@"
        static let failedToSavePost = "Failed to save post: %@"
    }
    
    enum Post {
        static let userId = "User ID"
    }
}
