//
//  ClientKey.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI

private struct ClientKey: EnvironmentKey {
    static let defaultValue = Client.shared
}

public extension EnvironmentValues {
    var client: Client {
        get { self[ClientKey.self] }
        set { self[ClientKey.self] = newValue }
    }
}
