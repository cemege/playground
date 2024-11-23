//
//  ButtonView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public struct ButtonView: View {
    
    // MARK: - Model
    private(set) var title: String = ""
    private(set) var theme: ButtonView.Theme = .primaryBlue(.enabled)
    private(set) var size: ButtonView.Size = .large
    private(set) var type: ButtonView.Types = .basic
    private(set) var action: EmptyClosure?
    
    // MARK: - init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .textModifier(size: size.labelSize, weight: .semibold, foregroundStyle: theme.titleColor)
        }
        .frame(maxWidth: .infinity, maxHeight: size.height)
        .background {
            theme.backgroundColor
        }
        .roundedCornerWithBorder(
            lineWidth: theme.borderWidth,
            borderColor: theme.borderColor
        )
    }
}

// MARK: - Builders
public extension ButtonView {
    func title(_ title: String) -> Self {
        var copy = self
        copy.title = title
        return copy
    }
    
    func theme(_ theme: ButtonView.Theme) -> Self {
        var copy = self
        copy.theme = theme
        return copy
    }
    
    func size(_ size: ButtonView.Size) -> Self {
        var copy = self
        copy.size = size
        return copy
    }
    
    func type(_ type: ButtonView.Types) -> Self {
        var copy = self
        copy.type = type
        return copy
    }
    
    func action(_ action: EmptyClosure?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

public extension ButtonView {
    enum Theme {
        case primaryBlue(_ state: ThemeState)
        case secondaryBlue(_ state: ThemeState)
        case primaryRed(_ state: ThemeState)
        case secondaryRed(_ state: ThemeState)
        case yellow(_ state: ThemeState)
        case gray(_ state: ThemeState)
        case white(_ state: ThemeState)
        
        public var titleColor: Color {
            switch self {
            case let .primaryBlue(state):
                return state == .enabled ? .white : .blue300
            case let .secondaryBlue(state):
                return state == .enabled ? .blue500 : .blue300
            case let .primaryRed(state):
                return state == .enabled ? .white : .red300
            case let .secondaryRed(state):
                return state == .enabled ? .red500 : .red300
            case let .yellow(state):
                return state == .enabled ? .gray900 : .gray600
            case let .gray(state):
                return state == .enabled ? .gray900 : .gray400
            case let .white(state):
                return state == .enabled ? .gray900 : .gray600
            }
        }
        
        public var backgroundColor: Color {
            switch self {
            case let .primaryBlue(state):
                return state == .enabled ? .blue500 : .blue100
            case .secondaryBlue:
                return .blue100
            case let .primaryRed(state):
                return state == .enabled ? .red500 : .red100
            case .secondaryRed:
                return .red100
            case let .yellow(state):
                return state == .enabled ? .yellow500 : .yellow100
            case let .gray(state):
                return state == .enabled ? .gray200 : .gray100
            case let .white(state):
                return state == .enabled ? .white : .gray100
            }
        }
        
        public var borderWidth: CGFloat {
            switch self {
            case let .white(state):
                return state == .enabled ? 2 : .zero
            default: return .zero
            }
        }
        
        public var borderColor: Color {
            switch self {
            case let .white(state):
                return state == .enabled ? .gray300 : .clear
            default: return .clear
            }
        }
    }
    
    enum Size {
        case xSmall
        case small
        case medium
        case large
        
        public var height: CGFloat {
            switch self {
            case .xSmall: return 24.0
            case .small: return 32.0
            case .medium: return 40.0
            case .large: return 48.0
            }
        }
        
        public var labelSize: CGFloat {
            switch self {
            case .xSmall, .small: return 12
            case .medium: return 14
            case .large: return 16
            }
        }
    }
    
    enum Types {
        case basic
        case iconLeft
        case iconRight
    }
    
    enum State {
        case primary
        case secondary
    }
    
    enum ThemeState {
        case enabled
        case disabled
    }
}

#Preview {
    ButtonView()
        .title("Button")
        .theme(.primaryBlue(.enabled))
        .size(.medium)
        .type(.basic)
        .action {
            print("Button Tapped")
        }
}
