//
//  Untitled.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct LoadingOverlayView: View {
    let isLoading: Bool
    
    var body: some View {
        if isLoading {
            ZStack {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .transition(.opacity)
            }
        }
    }
}
