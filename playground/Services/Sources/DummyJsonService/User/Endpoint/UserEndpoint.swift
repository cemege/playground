//
//  UserEndpoint.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public enum UserEndpoint: EndpointProtocol {
    case users
    
    public var domain: Domain {
        return .dummyjson
    }
    
    public var path: String {
        switch self {
        case .users: "users"
        }
    }
}
