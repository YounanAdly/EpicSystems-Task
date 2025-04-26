//
//  EmptyPlaceholderView.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    let itemCount: Int
    let message: String

    var body: some View {
        if itemCount == 0 {
            VStack {
                Text(message)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.opacity)
        }
    }
}
