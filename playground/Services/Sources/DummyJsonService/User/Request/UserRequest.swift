//
//  UserRequest.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public enum UserRequest: Request {
    case users
    
    public var endpoint: any EndpointProtocol {
        switch self {
        case .users: return UserEndpoint.users
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .users: return .GET
        }
    }
}
