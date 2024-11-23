//
//  TextFieldSwiftUIViewType.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public enum TextFieldViewType {
    case email
    
    public var title: String {
        switch self {
        case .email: return "E-posta"
        }
    }
    
    public var errorText: String? {
        switch self {
        case .email: return "E-posta girmelisin"
        }
    }
    
    public var placeholder: String? {
        return nil
    }
    
    public var keyboardType: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        }
    }
    
    public var textContentType: UITextContentType {
        switch self {
        case .email: return .emailAddress
        }
    }
}

public enum TextFieldViewStateType {
    case enabled
    case disabled
    case focus
    case filled
    case error
    
    public var backgroundColor: Color {
        switch self {
        case .enabled, .filled: return .gray200
        case .disabled: return .gray100
        case .focus: return .white
        case .error: return .red100
        }
    }
    
    public var borderWidth: CGFloat {
        switch self {
        case .enabled, .disabled, .filled: return .zero
        case .focus, .error: return 2
        }
    }
    
    public var borderColor: Color {
        switch self {
        case .enabled, .disabled, .filled: return .clear
        case .focus: return .blue300
        case .error: return .red500
        }
    }
    
    public var textColor: Color {
        switch self {
        case .enabled, .focus, .filled: return .gray900
        case .disabled: return .gray600
        case .error: return .red500
        }
    }
}
