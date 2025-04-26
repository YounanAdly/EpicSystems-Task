//
//  SearchBar.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(Localizable.Post.searchPlaceHolder, text: $text)
                .textFieldStyle(.plain)
                .autocorrectionDisabled()
                .onChange(of: text) { _, _ in
                    withAnimation(.easeInOut(duration: 0.25)) {
                        // Animation triggered when text changes
                    }
                }
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
