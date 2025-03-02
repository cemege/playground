//
//  HomeView.swift
//  Features
//
//  Created by Cem Ege on 25.11.2024.
//

import SwiftUI
import Router
import Components

public struct HomeView: View {
    
    @Environment(Router.self) var router
    
    // MARK: - init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        VStack {
            VStack(spacing: 48) {
                ButtonView()
                    .title("Home List View")
                    .theme(.primaryBlue(.enabled))
                    .size(.medium)
                    .type(.basic)
                    .action {
                        router.navigate(to: HomeUIRoutes.list)
                    }
                
                ButtonView()
                    .title("Profile Settings")
                    .theme(.primaryBlue(.enabled))
                    .size(.medium)
                    .type(.basic)
                    .action {
                        if let destination = RouteRegistry.shared.route(forId: "profile.settings", param: "") {
                            router.move(to: .profile, destination: destination)
                        }
                    }
            }
            .navigationTitle("Home")
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
