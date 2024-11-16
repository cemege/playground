//
//  ShadowModifier.swift
//  Extensions
//
//  Created by Cem Ege on 12.08.2024.
//

import SwiftUI

public struct ShadowModifier: ViewModifier {
    
    public let backgroundColor: Color
    public let cornerRadius: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(color: .shadowColor, radius: cornerRadius, x: .zero, y: .zero)
    }
}

public extension View {
    func shadowModifier(backgroundColor: Color = .white, cornerRadius: CGFloat = 4) -> some View {
        modifier(ShadowModifier(backgroundColor: backgroundColor, cornerRadius: cornerRadius))
    }
}
