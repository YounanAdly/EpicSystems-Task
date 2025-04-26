//
//  PostsItemView.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI


struct PostItemView: View {
    let post: PostsResponse
    let isSaved: Bool
    let saveAction: (PostsResponse) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.blue)
                
                Text("\(Localizable.Post.userId): \(post.userId)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    saveAction(post)
                }) {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isSaved ? .red : .gray)
                }
                .buttonStyle(.plain)
            }
            
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding(.top, 4)
            
            Text(post.body)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineSpacing(5)
            
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}
