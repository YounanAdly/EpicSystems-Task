// HomeView.swift
// EpicSystems-Task

import Foundation
import SwiftUI


struct HomeView<ViewModel: HomeViewModelContract>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        EmptyView()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
