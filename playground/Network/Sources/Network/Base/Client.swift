//
//  Client.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

import Foundation
import Observation

public final class Client: ClientProtocol {
    
    // MARK: - Properties
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Fetch
    public func fetch<T: Decodable>(request: Request, _ decodable: T.Type) async -> Result<T, NetworkError> {
        do {
            return try await fetch(request: request, response: decodable)
        } catch let error as NetworkError {
            //TODO: Alert presenting
            return .failure(error)
        } catch {
            //TODO: Alert presenting
            return .failure(NetworkError(type: .unknown, message: "Unknown Error"))
        }
    }
    
    private func fetch<T: Decodable>(request: Request, response: T.Type) async throws -> Result<T, NetworkError> {
        guard let urlRequest = request.buildURLRequest() else {
            return .failure(NetworkError(type: .notFound, message: "Invalid URL"))
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let urlResponse = response as? HTTPURLResponse else {
                return .failure(NetworkError(type: .badRequest, message: "Bad Request"))
            }
            
            guard (200...299).contains(urlResponse.statusCode) else {
                return .failure(NetworkError(type: .noResponse, message: "No Response"))
            }
            
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedResponse)
        } catch let error as DecodingError {
            return .failure(NetworkError.handleDecodingError(error: error))
        } catch {
            return .failure(NetworkError(type: .unknown, message: "Unknown Error"))
        }
    }
}
