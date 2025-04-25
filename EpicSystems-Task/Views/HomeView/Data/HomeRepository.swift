// HomeRepository.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeRepository :HomeRepositoryContract {
    
    // MARK: - PROPERTIES
    private let service: HomeServiceContract
    
    
    // MARK: - INIT
    init(service: HomeServiceContract = HomeService()) {
        self.service = service

    }
 
    // MARK: - REPOSITORIES METHODS
    
}


