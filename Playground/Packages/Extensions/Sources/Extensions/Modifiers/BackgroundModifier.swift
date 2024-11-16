//
//  BackgroundModifier.swift
//  Extensions
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI

public extension View {
    func gradientBackground(
        colors: [Color],
        startPoint: UnitPoint = .leading,
        endPoint: UnitPoint = .trailing,
        opacity: Double = 1.0
    ) -> some View {
        self
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
                .opacity(opacity)
            )
    }
    
}
