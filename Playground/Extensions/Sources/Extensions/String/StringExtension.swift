//
//  StringExtension.swift
//  Extensions
//
//  Created by Cem Ege on 16.11.2024.
//

import Foundation

public extension String {
    
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}

// MARK: - Data Type Conversion
public extension String {
    
    var toInt: Int? {
        return Int(self)
    }
    
    var toDouble: Double? {
        return Double(self)
    }
    
    var toDecimal: Decimal? {
        return Decimal(string: self)
    }
    
    var toData: Data? {
        return data(using: .utf8)
    }
    
    var toURL: URL? {
        return URL(string: self)
    }
}

// MARK: - Bundle
public extension String {
    static let appVersion = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? ""
}
