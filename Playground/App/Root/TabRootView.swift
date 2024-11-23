//
//  TabRootView.swift
//  Playground
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI
import Router

struct TabRootView: View {
    
    // MARK: - Properties
    @Environment(Router.self) var router
    
    let tab: AppTab
    
    // MARK: - Body
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router[tab]) {
            tab.rootView
                .navigationBarHidden(true)
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .accountSettings:
                        HStack {
                            Text("Account Settings")
                        }
                    }
                }
        }
        .containerRelativeFrame([.horizontal, .vertical])
    }
}

extension AppTab {
    @ViewBuilder
    fileprivate var rootView: some View {
        switch self {
        case .home:
            HStack {
                Text("Home")
            }
            
        case .search:
            HStack {
                Text("Settings")
            }
            
        case .profile:
            HStack {
                Text("Profile")
            }
        }
    }
}

#Preview {
    TabRootView(tab: .profile)
}
