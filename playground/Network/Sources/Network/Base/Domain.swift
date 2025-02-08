//
//  Domain.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

public enum Domain {
    case `default`
    case dummyjson
    
    var baseURL: String {
        switch self {
        case .default: return ""
        case .dummyjson: return "dummyjson.com"
        }
    }
}
