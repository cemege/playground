//
//  UserService.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public protocol UserServiceProtocol: Sendable {
    func fetchUser(request: UserRequest) async -> Result<UsersResponse, NetworkError>
}

public final class UserService: UserServiceProtocol {
    
    private let client: ClientProtocol
    
    public init(client: ClientProtocol = Client()) {
        self.client = client
    }
    
    public func fetchUser(request: UserRequest) async -> Result<UsersResponse, NetworkError> {
        return await client.fetch(request: request, UsersResponse.self)
    }
}
