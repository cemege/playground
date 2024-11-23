//
//  CircularLoadingView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public struct CircularLoadingView: View {
    
    // MARK: - Properties
    @State private var isAnimating = false
    
    private(set) var theme: ThemeType = .blue

    // MARK: - Init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        Circle()
            .stroke(theme.secondaryColor, lineWidth: 4)
            .frame(width: 40, height: 40)
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(theme.primaryColor, lineWidth: 4)
                    .frame(width: 40, height: 40)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(
                        Animation.linear(duration: 1.25).repeatForever(autoreverses: false),
                        value: isAnimating
                    )
                    .onAppear {
                        isAnimating = true
                    }
            )
    }
}

// MARK: - Builders
public extension CircularLoadingView {
    func theme(_ theme: ThemeType) -> Self {
        var copy = self
        copy.theme = theme
        return copy
    }
}

// MARK: - Types
public extension CircularLoadingView {
    enum ThemeType {
        case blue
        case red
        
        public var primaryColor: Color {
            switch self {
            case .blue: return Color.blue500
            case .red: return Color.red500
            }
        }
        
        public var secondaryColor: Color {
            switch self {
            case .blue: return Color.blue300
            case .red: return Color.red300
            }
        }
    }
}

#Preview {
    CircularLoadingView()
        .theme(.blue)
}
