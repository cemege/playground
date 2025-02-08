//
//  MemberEndpoint.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public enum MemberEndpoint: EndpointProtocol {
    case member(id: Int)
    
    public var path: String {
        switch self {
        case .member: "/member"
        }
    }
    
    public var queryItems: [String : Any?]? {
        switch self {
        case let .member(id):
            return ["id": id]
        }
    }
}
