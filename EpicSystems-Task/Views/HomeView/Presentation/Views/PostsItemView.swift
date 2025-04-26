//
//  PostsItemView.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//
import SwiftUI

struct PostItemView: View {
    var post: PostsResponse
    
    init(post: PostsResponse) {
        self.post = post
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width:24,height: 24)
                
                Text("User ID: \(post.userId)")
                    .font(.body)
                    .foregroundColor(.secondary)
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
