//
//  MemberService.swift
//  Services
//
//  Created by Cem Ege on 8.02.2025.
//

import Network

public protocol MemberServiceProtocol: Sendable {
    func fetchMember(request: MemberRequest) async -> Result<MemberModel, NetworkError>
}

public final class MemberService: MemberServiceProtocol {
    
    private let client: ClientProtocol
    
    public init(client: ClientProtocol = Client()) {
        self.client = client
    }
    
    public func fetchMember(request: MemberRequest) async -> Result<MemberModel, NetworkError> {
        return await client.fetch(request: request, MemberModel.self)
    }
}
