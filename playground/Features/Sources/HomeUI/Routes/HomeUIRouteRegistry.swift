//
//  HomeUIRouteRegistry.swift
//  Features
//
//  Created by Cem Ege on 2.03.2025.
//

import Router
import SwiftUI

public func registerHomeUIRoutes() async {
    await RouteRegistry.shared.register(id: "home.main") { _ in HomeUIRoutes.home }
    await RouteRegistry.shared.register(id: "home.list") { _ in HomeUIRoutes.list }
}
