// HomeUseCase.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeUseCase :HomeUseCaseContract {

    // MARK: - PROPERTIES
    private let repository: HomeRepositoryContract

    // MARK: - INIT
    init(repository: HomeRepositoryContract = HomeRepository()) {
        self.repository = repository
    }

    // MARK: - USECASE METHODS
}
