//
//  TextFieldView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public struct TextFieldView: View {
    
    // MARK: - Properties
    @Binding var text: String
    @Binding var stateType: TextFieldViewStateType
    @FocusState var isFocused: Bool
    
    private(set) var type: TextFieldViewType = .email
    private(set) var onEditingChanged: BoolClosure = { _ in }
    private(set) var onCommit: StringClosure = { _ in }
    private(set) var onChangeCharacter: StringClosure = { _ in }
    
    // MARK: - init
    public init(
        text: Binding<String>,
        stateType: Binding<TextFieldViewStateType>,
        isFocused: FocusState<Bool>
    ) {
        self._text = text
        self._stateType = stateType
        self._isFocused = isFocused
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(type.title)
                .textModifier(weight: .semibold, foregroundStyle: .gray800)
            
            VStack(alignment: .leading, spacing: 4) {
                TextField(
                    "", text: $text,
                    onEditingChanged: { isEditing in onEditingChanged(isEditing) },
                    onCommit: { onCommit(text) }
                )
                .focused($isFocused)
                .onChange(of: text) { oldValue, newValue in onChangeCharacter(newValue) }
                .onChange(of: isFocused) { oldValue, newValue in configureFocusState(newValue) }
                .foregroundColor(stateType.textColor)
                .textContentType(type.textContentType)
                .keyboardType(type.keyboardType)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(10)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(stateType.backgroundColor)
                .roundedCornerWithBorder(
                    lineWidth: stateType.borderWidth,
                    borderColor: stateType.borderColor
                )
                
                if stateType == .error {
                    Text(type.errorText ?? "")
                        .textModifier(size: 11, foregroundStyle: .red500)
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60, alignment: .topLeading)
    }
}

// MARK: - Builders
public extension TextFieldView {
    func type(_ type: TextFieldViewType) -> Self {
        var copy = self
        copy.type = type
        return copy
    }
    
    func onEditingChanged(_ closure: @escaping BoolClosure) -> Self {
        var copy = self
        copy.onEditingChanged = closure
        return copy
    }
    
    func onCommit(_ closure: @escaping StringClosure) -> Self {
        var copy = self
        copy.onCommit = closure
        return copy
    }
    
    func onChangeCharacter(_ closure: @escaping StringClosure) -> Self {
        var copy = self
        copy.onChangeCharacter = closure
        return copy
    }
}

// MARK: - FocusState Helper
private extension TextFieldView {
    func configureFocusState(_ isFocused: Bool) {
        if isFocused {
            stateType = .focus
        } else if !isFocused, stateType != .error, !text.isEmpty, !text.isBlank {
            stateType = .filled
        } else if !isFocused, stateType != .error, text.isEmpty {
            stateType = .enabled
        } else if !isFocused, stateType == .error {
            return
        }
    }
}

#Preview {
    TextFieldView(
        text: .constant("cem@cemege.dev"),
        stateType: .constant(.enabled),
        isFocused: .init()
    )
    .onEditingChanged({ _ in })
    .onCommit({ _ in })
    .onChangeCharacter({ _ in })
}
