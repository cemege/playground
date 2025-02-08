//
//  Endpoint.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation

public enum EndpointURLComponent {
    public static let urlScheme: String = "https"
}

public protocol EndpointProtocol {
    var domain: Domain { get }
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [String: Any?]? { get }
}

public extension EndpointProtocol {
    var url: URL {
        buildURL()
    }
    
    var domain: Domain {
        .default
    }
    
    var baseURL: String {
        domain.baseURL
    }
    
    var path: String {
        ""
    }
    
    var queryItems: [String: Any?]? {
        nil
    }
}

// MARK: - Build
public extension EndpointProtocol {
    func buildURL() -> URL {
        var components = URLComponents()
        components.scheme = EndpointURLComponent.urlScheme
        components.host = baseURL
        components.path = "/" + path
        components.queryItems = Self.convertToURLQueryItems(dict: queryItems)
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

// MARK: - URLQueryItem Convert
private extension EndpointProtocol {
    static func convertToURLQueryItems(dict: [String: Any?]?) -> [URLQueryItem]? {
        guard let dict = dict else { return nil }
        
        return dict
            .filter { _, value in value != nil }
            .flatMap { key, value in Self.buildQueryItems(key: key, value: value) }
    }

    static func buildQueryItems(key: String, value: Any?) -> [URLQueryItem] {
        guard let value else {
            return [ URLQueryItem(name: key, value: nil) ]
        }

        switch value {
        case is String:
            return [ URLQueryItem(name: key, value: value as? String) ]
            
        case is Int,
            is Int32,
            is Bool,
            is Double,
            is Float:
            return [ URLQueryItem(name: key, value: String(describing: value)) ]
            
        case let value as [Any]:
            return value
                .filter { false == ($0 is [Any]) }
                .flatMap { Self.buildQueryItems(key: key, value: $0) }
            
        default:
            return []
        }
    }
}
