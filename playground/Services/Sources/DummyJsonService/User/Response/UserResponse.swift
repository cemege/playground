//
//  UserResponse.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

public struct UsersResponse: Decodable, Sendable {
    public let users: [UserModel]
}

public struct UserModel: Decodable, Sendable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let maidenName: String
    public let age: Int
    public let gender: String
    public let email: String
    public let phone: String
    public let username: String
    public let password: String
    public let birthDate: String
    public let image: String
    public let bloodGroup: String
    public let height: Double
    public let weight: Double
    public let eyeColor: String
}
