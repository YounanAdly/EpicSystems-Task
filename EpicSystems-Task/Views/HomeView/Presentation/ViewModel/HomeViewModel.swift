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
    
    // MARK: - INIT
    init(
        useCase: HomeUseCaseContract = HomeUseCase()
    ) {
        self.useCase = useCase
        self.subscriptions = .init()
        self.getPosts()
    }
    
}

extension HomeViewModel{
    var navigationTitle: String {
        Localizable.Home.listOfPosts.uppercased()
    }
    
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
}
