//
//  PostsItemView.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct PostItemView: View {
    let post: PostsResponse
    let isSaved: Bool // Indicates if the post is already saved
    let saveAction: (PostsResponse) -> Void // Action to save the post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text("User ID: \(post.userId)")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    saveAction(post) // Call the save action when the button is pressed
                }) {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .foregroundColor(isSaved ? .red : .gray)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)
            }
            
            Text(post.title)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text(post.body)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineSpacing(6)
            
            Divider()
        }
        .transition(.asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        ))
    }
}
