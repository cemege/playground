//
//  RoundedCorner.swift
//  Extensions
//
//  Created by Cem Ege on 27.08.2024.
//

import SwiftUI

public struct RoundedCorner: Shape {
    public var radius: CGFloat = .infinity
    public var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    func roundedCornerWithBorder(
        lineWidth: CGFloat,
        borderColor: Color,
        radius: CGFloat = 4,
        corners: UIRectCorner = .allCorners
    ) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
            .overlay(RoundedCorner(radius: radius, corners: corners)
                .stroke(borderColor, lineWidth: lineWidth))
    }
}
