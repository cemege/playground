//
//  MemberEndpoint.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

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
