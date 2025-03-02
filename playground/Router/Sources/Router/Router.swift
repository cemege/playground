//
//  Router.swift
//  Router
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI
import Observation

/// `Router` is a navigation management class that handles both in-package and cross-package navigation.
/// It maintains separate navigation stacks for each app tab and provides methods to navigate between views.
///
/// Usage:
/// - For in-package navigation, use the generic methods (`navigate<T: RouteProtocol>`, `move<T: RouteProtocol>`)
/// - For cross-package navigation, use the type-erased methods (`navigate(to:)`, `move(to:destination:)`)
@Observable
public final class Router {
    
    // MARK: - Properties
    
    /// The currently presented sheet, if any.
    public var presentedSheet: (any RouteProtocol)?
    
    // MARK: - Path Subscript
    
    /// Dictionary containing navigation paths for each tab.
    /// Each path is an array of `RouteProtocol` representing the navigation stack.
    public var paths: [AppTab: [any RouteProtocol]] = [
        .home: [],
        .search: [],
        .profile: []
    ]
    
    // MARK: - SelectedTab Path
    
    /// The currently selected app tab.
    public var selectedTab: AppTab = .home
    
    /// The navigation path array for the currently selected tab.
    public var selectedTabPath: [any RouteProtocol] {
        paths[selectedTab] ?? []
    }
    
    // MARK: - init
    
    /// Creates a new Router instance with empty navigation paths.
    public init() {}
    
    // MARK: - Navigation
    
    /// Navigates to a destination within the same package.
    ///
    /// This method provides type-safety when navigating within the same package.
    /// - Parameters:
    ///   - destination: The destination route to navigate to.
    ///   - tab: The tab to navigate within. If nil, uses the currently selected tab.
    public func navigate<T: RouteProtocol>(to destination: T, tab: AppTab? = nil) {
        paths[tab ?? selectedTab]?.append(destination)
    }
    
    /// Navigates to a destination that may be from another package.
    ///
    /// This method uses type erasure to allow navigation between different packages.
    /// - Parameters:
    ///   - destination: The destination route to navigate to.
    ///   - tab: The tab to navigate within. If nil, uses the currently selected tab.
    public func navigate(to destination: any RouteProtocol, tab: AppTab? = nil) {
        paths[tab ?? selectedTab]?.append(destination)
    }
    
    /// Changes the selected tab and navigates to a destination within the same package.
    ///
    /// - Parameters:
    ///   - tab: The tab to switch to.
    ///   - destination: The destination route to navigate to after switching tabs.
    public func move<T: RouteProtocol>(to tab: AppTab, destination: T) {
        selectedTab = tab
        paths[tab]?.append(destination)
    }
    
    /// Changes the selected tab and navigates to a destination that may be from another package.
    ///
    /// - Parameters:
    ///   - tab: The tab to switch to.
    ///   - destination: The destination route to navigate to after switching tabs.
    public func move(to tab: AppTab, destination: any RouteProtocol) {
        selectedTab = tab
        paths[tab]?.append(destination)
    }
    
    /// Clears the navigation stack for a specific tab.
    ///
    /// - Parameter tab: The tab to clear the navigation stack for.
    public func popToRoot(for tab: AppTab) {
        paths[tab] = []
    }
    
    /// Removes the most recent route from the navigation stack.
    ///
    /// - Parameter tab: The tab to pop from. If nil, uses the currently selected tab.
    public func pop(tab: AppTab? = nil) {
        paths[tab ?? selectedTab]?.removeLast()
    }
}

// MARK: - App Tab Types

/// Represents the main tabs in the application.
public enum AppTab: String, CaseIterable, Identifiable, Hashable, Sendable {
    case home, search, profile
    
    /// Unique identifier for the tab, uses the raw string value.
    public var id: String { rawValue }
    
    /// System icon name for the tab.
    public var icon: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .profile: return "person"
        }
    }
}

/// Environment value extension to access the current tab from any view.
extension EnvironmentValues {
    @Entry public var currentTab: AppTab = .home
}
