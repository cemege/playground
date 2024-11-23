//
//  Router.swift
//  Router
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI

public enum AppTab: String, CaseIterable, Identifiable, Hashable, Sendable {
    case home, search, profile
    
    public var id: String { rawValue }
    
    public var icon: String {
        switch self {
        case .home: return "homeIcon"
        case .search: return "searchIcon"
        case .profile: return "profileIcon"
        }
    }
}

public extension EnvironmentValues {
    @Entry var tab: AppTab = .home
}

public enum Destination: Hashable {
     case accountSettings
}

@Observable
@MainActor
public final class Router {
    
    private var paths: [AppTab: [Destination]] = [:]
    
    public subscript(tab: AppTab) -> [Destination] {
        get { paths[tab] ?? [] }
        set { paths[tab] = newValue }
    }
    
    public init() {}
    
    public func navigate(to destination: Destination, tab: AppTab) {
        paths[tab]?.append(destination)
    }
    
    public func popToRoot(for tab: AppTab) {
        paths[tab] = []
    }
    
    public func pop(tab: AppTab) {
        paths[tab]?.removeLast()
    }
}
