//
//  Router.swift
//  Router
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI
import Observation

@Observable
@MainActor
public final class Router {
    
    // MARK: - Properties
    public var presentedSheet: SheetDestination?
    
    // MARK: - Path Subscript
    private var paths: [AppTab: [RouterDestination]] = [
        .home: [],
        .search: [],
        .profile: []
    ]
    
    public subscript(tab: AppTab) -> [RouterDestination] {
        get { paths[tab] ?? [] }
        set { paths[tab] = newValue }
    }
    
    // MARK: - SelectedTab Path
    public var selectedTab: AppTab = .home
    public var selectedTabPath: [RouterDestination] {
        paths[selectedTab] ?? []
    }
    
    // MARK: - init
    public init() {}
    
    // MARK: - Navigation
    public func navigate(to destination: RouterDestination, tab: AppTab? = nil) {
        paths[tab ?? selectedTab]?.append(destination)
    }
    
    public func move(to tab: AppTab, destination: RouterDestination) {
        selectedTab = tab
        paths[tab]?.append(destination)
    }
    
    public func popToRoot(for tab: AppTab) {
        paths[tab] = []
    }
    
    public func pop(tab: AppTab? = nil) {
        paths[tab ?? selectedTab]?.removeLast()
    }
}

// MARK: - App Tab Types
public enum AppTab: String, CaseIterable, Identifiable, Hashable, Sendable {
    case home, search, profile
    
    public var id: String { rawValue }
    
    public var icon: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .profile: return "person"
        }
    }
}

extension EnvironmentValues {
  @Entry public var currentTab: AppTab = .home
}

// MARK: - RouterDestionation
public enum RouterDestination: Hashable {
    case homeList
    case searchResult
    case profileSettings
}

// MARK: - Sheet Destination
public enum SheetDestination: Hashable, Identifiable {
    case login
    
    public var id: Int { self.hashValue }
}
