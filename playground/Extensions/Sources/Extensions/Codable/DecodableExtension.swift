//
//  DecodableExtension.swift
//  Extensions
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation

public extension Decodable {
    static func decode(_ data: Data) -> Self? {
        try? JSONDecoder().decode(self, from: data)
    }

    static func decode(_ data: String) -> Self? {
        try? JSONDecoder().decode(self, from: Data(data.utf8))
    }
    
    static func decodeFromAny(_ anyObject: Any?) -> Self? {
        guard let dict = anyObject as? [String: Any],
              let data = dict.data()
        else { return nil }
        
        return self.decode(data)
    }
}
