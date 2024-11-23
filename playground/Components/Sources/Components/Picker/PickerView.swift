//
//  PickerView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Extensions

public struct PickerView: View {
    
    // MARK: - Properties
    @Binding public var selectedItem: String
    @Binding public var stateType: PickerViewStateType
    
    private(set) var type: PickerViewType = .city(hasTitle: true)
    private(set) var tapGesture: EmptyClosure?
    
    // MARK: - init
    public init(selectedItem: Binding<String>, stateType: Binding<PickerViewStateType>) {
        self._selectedItem = selectedItem
        self._stateType = stateType
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !type.title.isEmpty {
                Text(type.title)
                    .textModifier(size: 16, weight: .semibold, foregroundStyle: .gray800)
            }
            
            HStack {
                Text(selectedItem.isEmpty ? "Seçin" : selectedItem)
                    .textModifier(size: 16, foregroundStyle: stateType.textColor)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .frame(width: 24, height: 24)
                    .foregroundStyle(stateType.imageForegroundColor)
            }
            .padding([.horizontal], 10)
            .frame(height: 48)
            .background(stateType.backgroundColor)
            .cornerRadius(4)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(stateType.borderColor, lineWidth: 2)
            }
            .onTapGesture {
                if stateType != .disabled {
                    tapGesture?()
                }
            }
            
            if stateType == .error {
                Text(type.errorText)
                    .textModifier(size: 12, foregroundStyle: .red500)
            }
        }
    }
}

// MARK: - Builders
public extension PickerView {
    func type(_ type: PickerViewType) -> Self {
        var copy = self
        copy.type = type
        return copy
    }
    
    func tapGesture(_ closure: EmptyClosure?) -> Self {
        var copy = self
        copy.tapGesture = closure
        return copy
    }
}

#Preview {
    PickerView(selectedItem: .constant(""), stateType: .constant(.enabled))
        .type(.city(hasTitle: true))
        .tapGesture(nil)
}
