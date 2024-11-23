//
//  LineLoadingView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public struct LineLoadingView: View {
    
    // MARK: - Properties
    @State private var offset: CGFloat = 0
    
    private(set) var lineHeight: CGFloat = 8
    private(set) var lineColor: Color = .red500
    private(set) var lineContainerColor: Color = .gray200
    
    // MARK: - Init
    public init() {}
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(lineContainerColor)
                    .frame(height: lineHeight)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(lineColor)
                    .frame(width: geometry.size.width * 0.2, height: lineHeight)
                    .offset(x: offset)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: offset )
                    .onAppear { offset = geometry.size.width - geometry.size.width * 0.2 }
            }
        }
        .frame(height: lineHeight)
        .padding(.horizontal)
    }
}

// MARK: - Builders
public extension LineLoadingView {
    func height(_ lineHeight: CGFloat) -> Self {
        var copy = self
        copy.lineHeight = lineHeight
        return copy
    }
    
    func animationColor(_ lineColor: Color, _ containerColor: Color) -> Self {
        var copy = self
        copy.lineColor = lineColor
        copy.lineContainerColor = containerColor
        return copy
    }
}

#Preview {
    LineLoadingView()
}
