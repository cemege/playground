//
//  AccessibilityWrapper.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

#if canImport(UIKit)

import UIKit

// MARK: - PropertyWrapper
@MainActor
@propertyWrapper
public struct AccessibilityWrapper<T: UIView> {
    public var wrappedValue: T? {
        didSet {
            wrappedValue?.accessibilityIdentifier = name
            
            debugPrint("----------------------------------------------------------------")
            debugPrint("The accessibility identifier of \(T.self) is set to \(name)")
            debugPrint("----------------------------------------------------------------")
        }
    }
    
    private let name: String
    
    public init(name: String) {
        self.name = name
    }
}

#endif
