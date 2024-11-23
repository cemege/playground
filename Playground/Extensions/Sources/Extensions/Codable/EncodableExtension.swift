//
//  EncodableExtension.swift
//  Extensions
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation

public extension Encodable {
    func data() -> Data? {
        try? JSONEncoder().encode(self)
    }
    
    func dictionary() -> [String: Any] {
        guard let data = data() else { return [:] }
        guard let jsonDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return [:] }
        return jsonDict
    }
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        return try? encoder.encode(self)
    }
    
    func encode() -> String? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        
        if let jsonData = try? encoder.encode(self) {
            return String(data: jsonData, encoding: .utf8)
        }
        
        return nil
    }
    
    func convertToDict() -> [String: Any]? {
        var dict: [String: Any]?
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            
        } catch {
            debugPrint("Error occured while converting Codable model to dictionary: \(error)")
        }
        
        return dict
    }
}
