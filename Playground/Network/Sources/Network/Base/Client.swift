//
//  Client.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation

public actor Client {
    
    // MARK: - Properties
    public static let shared = Client()
    
    private let session = URLSession.shared
    
    // MARK: - init
    private init() {}
    
    // MARK: - Fetch
    public func fetch<T: Decodable>(request: Request, _ decodable: T.Type) async -> T? {
        return try? await fetch(request: request, response: T.self)
    }
    
    private func fetch<T: Decodable>(request: Request, response: T.Type) async throws -> T {
        guard let urlRequest = request.buildURLRequest() else {
            throw NetworkError(type: .notFound, message: "Invalid URL")
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let urlResponse = response as? HTTPURLResponse else {
            throw NetworkError(type: .badRequest, message: "Bad Request")
        }
        
        guard (200...299).contains(urlResponse.statusCode) else {
            throw NetworkError(type: .noResponse, message: "No Response")
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch let error as DecodingError {
            throw NetworkError.handleDecodingError(error: error)
        }
    }
}


