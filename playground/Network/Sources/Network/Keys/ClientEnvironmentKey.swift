//
//  ClientEnvironmentKey.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI

private struct ClientEnvironmentKey: EnvironmentKey {
    static let defaultValue: Client = Client()
}

public extension EnvironmentValues {
    var client: Client {
        get { self[ClientEnvironmentKey.self] }
        set { self[ClientEnvironmentKey.self] = newValue }
    }
}
