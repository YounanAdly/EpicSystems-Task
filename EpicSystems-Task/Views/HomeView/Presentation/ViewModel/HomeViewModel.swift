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
    
    // MARK: - INIT
    init(
        useCase: HomeUseCaseContract = HomeUseCase()
    ) {
        self.useCase = useCase
        self.subscriptions = .init()
    }
    
}

extension HomeViewModel{
    var navigationTitle: String {
        ""
    }
}
