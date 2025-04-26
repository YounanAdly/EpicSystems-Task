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
    @Published var searchText: String = "" // << ✅ Add this

    
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
    
    
    // MARK: - TOGGLE BUTTON TO SAVE & UNSAVED FROM DATABASE
    func toggleFavorite(_ post: PostsResponse) {
        shouldDisplayLoading = true
        if databasePosts.contains(where: { $0.id == post.id }) {
            deletePost(post)
        } else {
            savePost(post)
        }
        shouldDisplayLoading = false
    }
    
    
    // MARK: - DELETE POST FROM DATABASE
    func deletePost(_ post: PostsResponse) {
        do {
            try useCase.excuteDeletePost(post)
            loadLocalPosts()
        } catch {
            let message = String(format: Localizable.CoreData.failedToDeletePost, error.localizedDescription)
            print(message)
            errorMessage = message
        }
    }
    
    
    // MARK: - SAVE POST INTO DATABASE
    func savePost(_ post: PostsResponse) {
        do {
            try useCase.excuteSavePost(post)
            loadLocalPosts()
        } catch {
            let message = String(format: Localizable.CoreData.failedToSavePost, error.localizedDescription)
            print(message)
            errorMessage = message
        }
    }
    
    
    // MARK: - FETCH LOCAL DATABASE POSTS
    private func loadLocalPosts() {
        do {
            self.databasePosts = try useCase.excuteLocalPosts()
            let message = String(format: Localizable.CoreData.fetchPostsFromCoreData, self.databasePosts.count)
            print(message)
        } catch {
            let message = String(format: Localizable.CoreData.failedToFetchPosts, error.localizedDescription)
            print(message)
            self.databasePosts = []
        }
    }
    
    
    // MARK: - SWIPE TO REFRESH POSTS
    func refreshPosts()  {
        shouldDisplayLoading = true
        self.getPosts()
        shouldDisplayLoading = false
    }
    
    
    
    
    // MARK: - NAVIGATION VIEW TITLE
    var navigationTitle: String {
        Localizable.Home.navigationTitle.uppercased()
    }
}

extension HomeViewModel {
    var filteredPosts: [PostsResponse] {
        if searchText.isEmpty {
            return listOfPosts
        } else {
            return listOfPosts.filter { post in
                post.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
