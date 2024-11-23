//
//  PickerViewType.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public enum PickerViewType {
    case city(hasTitle: Bool = true)
    case district(hasTitle: Bool = true)
    
    public var title: String {
        switch self {
        case let .city(hasTitle):
            guard hasTitle else { return "" }
            return "İl"
        case let .district(hasTitle):
            guard hasTitle else { return "" }
            return "İlçe"
        }
    }
    
    public var errorText: String {
        return "Seçim yapmalısın"
    }
}

public enum PickerViewStateType {
    case enabled
    case disabled
    case filled
    case error
    
    public var textColor: Color {
        switch self {
        case .enabled: return .gray700
        case .disabled: return .gray600
        case .filled: return .gray900
        case .error: return .red500
        }
    }
    
    public var backgroundColor: Color {
        switch self {
        case .enabled, .filled: return .gray200
        case .disabled: return .gray100
        case .error: return .red100
        }
    }
    
    public var borderColor: Color {
        switch self {
        case .enabled, .disabled, .filled: return .clear
        case .error: return .red500
        }
    }
    
    public var imageForegroundColor: Color {
        switch self {
        case .enabled, .filled: return .gray900
        case .disabled: return .gray600
        case .error: return .red500
        }
    }
}
