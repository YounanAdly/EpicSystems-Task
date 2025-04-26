//
//  ScrollableContent.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct ScrollableContent<Item, Content: View>: View where Item: Identifiable {
    let orientation: Axis.Set
    let showsIndicators: Bool
    let items: [Item]
    let content: (Item) -> Content
    
    var body: some View {
        listView
    }
    
    var listView: some View {
        ScrollView(orientation, showsIndicators: showsIndicators) {
            if orientation == .horizontal {
                LazyHStack(alignment: .center, spacing: 16) {
                    ForEach(items) { item in
                        content(item)
                    }
                }
                .padding(.horizontal)
            } else {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(items) { item in
                        content(item)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
