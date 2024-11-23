//
//  MemberRequest.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

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
