// HomeViewModelContract.swift
// EpicSystems-Task

import Foundation
import SwiftUI

typealias HomeViewModelContract = HomeViewModelInput & HomeViewModelOutput


protocol HomeViewModelInput: ObservableObject {

}

protocol HomeViewModelOutput: ObservableObject {
    var navigationTitle: String { get }
    var shouldDisplayLoading: Bool { get }
}
