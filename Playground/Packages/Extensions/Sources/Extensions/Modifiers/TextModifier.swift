//
//  TextModifier.swift
//  Extensions
//
//  Created by Cem Ege on 12.08.2024.
//

import SwiftUI

public struct TextModifier: ViewModifier {
    
    public var size: CGFloat
    public var weight: Font.Weight
    public var foregroundStyle: Color
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(foregroundStyle)
    }
}

public extension View {
    func textModifier(size: CGFloat = 14, weight: Font.Weight = .regular, foregroundStyle: Color = .gray900) -> some View {
        modifier(TextModifier(size: size, weight: weight, foregroundStyle: foregroundStyle))
    }
}
