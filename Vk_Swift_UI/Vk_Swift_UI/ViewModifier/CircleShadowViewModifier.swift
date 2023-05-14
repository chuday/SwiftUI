//
//  CircleShadowViewModifier.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 08.12.2021.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowOpacity: Double
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                            .fill(Color.white)
                            .shadow(color: shadowColor.opacity(shadowOpacity),
                                    radius: shadowRadius))
    }
}


