//
//  File.swift
//  Features
//
//  Created by Cem Ege on 2.03.2025.
//

import Router

// Public registration function for ProfileUI
public func registerProfileUIRoutes() async {
    await RouteRegistry.shared.register(id: "profile.main") { _ in ProfileUIRoutes.profile }
    await RouteRegistry.shared.register(id: "profile.settings") { _ in ProfileUIRoutes.settings }
}
