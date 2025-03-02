//
//  RouteRegistry.swift
//  Router
//
//  Created by Cem Ege on 2.03.2025.
//

import SwiftUI

/// `RouteRegistry` enables cross-package navigation by providing a central registry
/// for routes that can be accessed by string identifiers.
///
/// This class allows feature packages to register their routes without creating direct
/// dependencies between them, preventing dependency cycles while enabling navigation
/// between any packages in the application.
///
/// Usage:
/// - Register routes at app startup with `register(id:builder:)`
/// - Resolve routes at runtime with `route(forId:param:)`
@MainActor
public final class RouteRegistry {
    /// Shared instance that serves as the central registry for all routes.
    public static let shared = RouteRegistry()
    
    /// Storage for registered route builders, keyed by string identifiers.
    /// Each builder takes an optional parameter and returns a RouteProtocol instance.
    private var routes: [String: (Any) -> any RouteProtocol] = [:]
    
    /// Registers a route with a unique string identifier and a builder function.
    ///
    /// This method should be called during app initialization to register all available routes.
    /// The generic parameter ensures type safety within each package when registering routes.
    ///
    /// - Parameters:
    ///   - id: A unique string identifier for the route, typically in the format "feature.route"
    ///   - builder: A closure that creates a route from an optional parameter
    public func register<T: RouteProtocol>(id: String, builder: @escaping (Any) -> T) {
        routes[id] = builder
    }
    
    /// Resolves a route from its string identifier and optional parameter.
    ///
    /// Use this method to get a route instance that can be passed to the Router
    /// for navigation between different packages.
    ///
    /// - Parameters:
    ///   - id: The string identifier for the route to resolve
    ///   - param: An optional parameter to pass to the route builder
    /// - Returns: A RouteProtocol instance if the route exists, or nil if not found
    public func route(forId id: String, param: Any) -> (any RouteProtocol)? { //TODO: Could param be optional? (Any?)
        return routes[id]?(param)
    }
}
