//
//  AnimatedContentModifier.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct AnimatedContentModifier<V: Equatable>: ViewModifier {
    let value: V
    let response: CGFloat
    let dampingFraction: CGFloat
    let blendDuration: CGFloat
    
    func body(content: Content) -> some View {
        content
            .animation(
                .interactiveSpring(response: response, dampingFraction: dampingFraction, blendDuration: blendDuration),
                value: value
            )
    }
}

extension View {
    func animatedContent<V: Equatable>(value: V, response: CGFloat = 0.6, dampingFraction: CGFloat = 0.8, blendDuration: CGFloat = 0.5) -> some View {
        self.modifier(AnimatedContentModifier(value: value, response: response, dampingFraction: dampingFraction, blendDuration: blendDuration))
    }
}
