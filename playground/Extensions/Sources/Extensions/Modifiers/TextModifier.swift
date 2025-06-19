//
//  TextModifier.swift
//  Extensions
//
//  Created by Cem Ege on 12.08.2024.
//

import SwiftUI

public extension View {
    func textModifier(size: CGFloat = 14, weight: Font.Weight = .regular, foregroundStyle: Color = .gray900) -> some View {
        self
            .font(.system(size: size, weight: weight))
            .foregroundStyle(foregroundStyle)
    }
}
