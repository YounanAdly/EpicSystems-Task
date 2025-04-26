// HomeViewModel.swift
// EpicSystems-Task


import Foundation
import Combine

class HomeViewModel: HomeViewModelContract {
    
    // MARK: - PROPERTIES
    private var subscriptions: Set<AnyCancellable>
    private let useCase: HomeUseCaseContract
    
    //MARK: - Published Values
    @Published var shouldDisplayLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var listOfPosts: [PostsResponse] = []
    @Published var databasePosts: [PostsResponse] = []
    
    // MARK: - INIT
    init(
        useCase: HomeUseCaseContract = HomeUseCase()
    ) {
        self.useCase = useCase
        self.subscriptions = .init()
        self.loadLocalPosts()
    }
    
}

extension HomeViewModel{
    
    // MARK: - API - FETCH POSTS LIST
    func getPosts() {
        useCase.excuteGetPosts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print(Localizable.APIS.requestFinishedSuccessfully)
                    self.shouldDisplayLoading = false
                case .failure(let error):
                    let message = "\(Localizable.APIS.requestFailedWithError): \(error.localizedDescription)"
                    print(message)
                    self.errorMessage = message
                    self.shouldDisplayLoading = false
                }
            } receiveValue: { posts in
                self.listOfPosts = posts
                self.shouldDisplayLoading = false
            }
            .store(in: &subscriptions)
    }
    
    
    func toggleFavorite(_ post: PostsResponse) {
        print("🟡 Toggling favorite for post ID: \(post.id)")
        shouldDisplayLoading = true
        loadLocalPosts()
        if databasePosts.contains(where: { $0.id == post.id }) {
            do {
                try useCase.excuteDeletePost(post)
                loadLocalPosts()
            } catch {
                print("Failed to delete post: \(error)")
                errorMessage = "Failed to delete post: \(error.localizedDescription)"
            }
        } else {
            do {
                try useCase.excuteSavePost(post)
                loadLocalPosts()
            } catch {
                print("Failed to save post: \(error)")
                errorMessage = "Failed to save post: \(error.localizedDescription)"
            }
        }
        shouldDisplayLoading = false
    }
    
    
    func savePost(_ post: PostsResponse) {
        do {
            try useCase.excuteSavePost(post)
            loadLocalPosts()
        } catch {
            print("Failed to save post: \(error)")
            errorMessage = "Failed to save post: \(error.localizedDescription)"
        }
    }
    
    private func loadLocalPosts() {
        do {
            self.databasePosts = try useCase.excuteLocalPosts()
            print("Fetched \(self.databasePosts.count) posts from Core Data")
            for post in self.databasePosts {
                print("📝 Post ID: \(post.id), Title: \(post.title)")
            }
        } catch {
            print("Failed to fetch posts: \(error.localizedDescription)")
            self.databasePosts = []
        }
    }
    
    
    func refreshPosts()  {
        shouldDisplayLoading = true
        self.getPosts()
        shouldDisplayLoading = false
    }
    
    
    // MARK: - NAVIGATION VIEW TITLE
    var navigationTitle: String {
        Localizable.Home.listOfPosts.uppercased()
    }
}
