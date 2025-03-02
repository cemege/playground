//
//  HomeRoutes.swift
//  Features
//
//  Created by Cem Ege on 2.03.2025.
//

import SwiftUI
import Router

public enum HomeUIRoutes: RouteProtocol {
    case home
    case list
    
    public func view() -> AnyView {
        switch self {
        case .home:
            return AnyView(HomeView())
        case .list:
            return AnyView(HomeListView())
        }
    }
}
