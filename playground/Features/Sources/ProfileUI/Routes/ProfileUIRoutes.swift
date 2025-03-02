//
//  ProfileRoutes.swift
//  Features
//
//  Created by Cem Ege on 2.03.2025.
//

import SwiftUI
import Router

public enum ProfileUIRoutes: RouteProtocol {
    case profile
    case settings
    
    public func view() -> AnyView {
        switch self {
        case .profile:
            return AnyView(ProfileView())
        case .settings:
            return AnyView(ProfileSettingsView())
        }
    }
}
