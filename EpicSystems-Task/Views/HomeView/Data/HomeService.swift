// HomeService.swift
// EpicSystems-Task

import Foundation
import Combine

final class HomeService :HomeServiceContract {
    
    // MARK: - Properties
    private let service: NetworkServiceContract
    
    // MARK: - Init
    init(service: NetworkServiceContract = NetworkService.shared) {
        self.service = service
    }
    
    // MARK: - SERVICE METHODS
    
}
