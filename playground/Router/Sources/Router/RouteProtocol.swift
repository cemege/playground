//
//  RouteProtocol.swift
//  Router
//
//  Created by Cem Ege on 1.03.2025.
//

import SwiftUI

/// `RouteProtocol` defines the interface for all navigation destinations in the application.
///
/// Any enum or struct that represents a navigation destination should conform to this protocol.
/// Each feature package can define its own route types that conform to RouteProtocol,
/// enabling both in-package type-safe navigation and cross-package navigation.
///
/// Example:
/// ```
/// enum ProfileRoutes: RouteProtocol {
///     case profile
///     case settings
///
///     func view() -> AnyView {
///         switch self {
///         case .profile:
///             return AnyView(ProfileView())
///         case .settings:
///             return AnyView(ProfileSettingsView())
///         }
///     }
/// }
/// ```
public protocol RouteProtocol: Hashable, Identifiable {
    
    /// A unique identifier for the route.
    /// By default, this returns the string representation of the route value.
    var id: String { get }
    
    /// Factory method to create the view for this route.
    /// This method is called when the router needs to instantiate the destination view.
    @MainActor
    @ViewBuilder
    func view() -> AnyView
}

/// Default implementation of the id property.
public extension RouteProtocol {
    var id: String {
        String(describing: self)
    }
}

/// `AnyRouteProtocol` provides type erasure for RouteProtocol instances.
///
/// This wrapper allows routes of different concrete types to be stored together
/// in collections like arrays while preserving their identity and equality semantics.
/// It's primarily used by SwiftUI's NavigationStack for type-erased navigation destinations.
public struct AnyRouteProtocol: Hashable {
    /// The wrapped route instance.
    public let wrappedValue: any RouteProtocol
    
    /// Creates a new type-erased route wrapper.
    ///
    /// - Parameter route: The route to wrap
    public init(_ route: any RouteProtocol) {
        self.wrappedValue = route
    }
    
    /// Hashes the essential components of the route.
    ///
    /// - Parameter hasher: The hasher to use for combining the components
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue.id)
    }
    
    /// Compares two type-erased routes for equality.
    ///
    /// Two routes are considered equal if their string identifiers match.
    ///
    /// - Parameters:
    ///   - lhs: The first route to compare
    ///   - rhs: The second route to compare
    /// - Returns: True if the routes are equal, false otherwise
    public static func == (lhs: AnyRouteProtocol, rhs: AnyRouteProtocol) -> Bool {
        lhs.wrappedValue.id == rhs.wrappedValue.id
    }
}
