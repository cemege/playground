//
//  Response.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

public struct Response<T: Decodable>: Decodable {
    public let data: T?
    //
    //
    //  ...
}
