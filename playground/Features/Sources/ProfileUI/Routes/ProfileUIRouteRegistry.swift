//
//  ProfileUIRouteRegistry.swift
//  Features
//
//  Created by Cem Ege on 2.03.2025.
//

import Router

public func registerProfileUIRoutes() {
    RouteRegistry.shared.register(id: "profile.main") { _ in ProfileUIRoutes.profile }
    RouteRegistry.shared.register(id: "profile.settings") { _ in ProfileUIRoutes.settings }
}
