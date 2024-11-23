//
//  MemberResponse.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

public struct MemberResponse: Decodable, Sendable {
    public let id: Int
    public let name: String
    public let surname: String
    public let email: String
    
    public init(id: Int, name: String, surname: String, email: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
    }
}
