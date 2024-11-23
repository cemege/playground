//
//  ProgressThemeType.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//


import SwiftUI
import Extensions

public enum ProgressThemeType {
    case red
    case blue
    
    public var color: Color {
        switch self {
        case .red:
            return Color.red500
        case .blue:
            return Color.blue500
        }
    }
}
