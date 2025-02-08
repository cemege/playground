//
//  MemberRequest.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public enum MemberRequest: Request {
    case member(id: Int)
    
    public var endpoint: any EndpointProtocol {
        switch self {
        case let .member(id):
            return MemberEndpoint.member(id: id)
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .member:
            return .GET
        }
    }
}
