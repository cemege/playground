//
//  Dictionary.swift
//  Extensions
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation

public extension Dictionary {
    func string() -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self),
              let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        return string
    }
    
    func data() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self) else { return nil }
        return data
    }
}
