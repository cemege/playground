//
//  MemberModel.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

public struct MemberModel: Decodable, Sendable {
    public let name: String
    public let surname: String
    public let email: String
}
