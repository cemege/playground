//
//  TabRootView.swift
//  Playground
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI
import Network
import Router
import HomeUI
import SearchUI
import ProfileUI

struct TabRootView: View {
    
    // MARK: - Properties
    @Environment(Router.self) var router
    
    let tab: AppTab
    
    // MARK: - Body
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: binding(for: tab)) {
            tab.rootView
                .navigationDestination(for: AnyRouteProtocol.self) { destination in
                    destination.wrappedValue.view()
                }
                .environment(\.currentTab, tab)
                .environment(router)
        }
    }
}

@MainActor
extension AppTab {
    @ViewBuilder
    fileprivate var rootView: some View {
        switch self {
        case .home:
            HomeView()
            
        case .search:
            SearchView()
            
        case .profile:
            ProfileView()
        }
    }
}

// MARK: - AnyRouteProtocol Binding
private extension TabRootView {
    /// Creates a two-way binding between the router's navigation path for a specific tab
    /// and SwiftUI's NavigationStack path binding.
    ///
    /// This function handles the type conversion between the router's storage format
    /// (`[any RouteProtocol]`) and NavigationStack's required format (`[AnyRouteProtocol]`).
    /// It wraps each route in an `AnyRouteProtocol` for type erasure when getting the path,
    /// and unwraps them when setting the path back to the router.
    ///
    /// - Parameter tab: The app tab to create a navigation path binding for
    /// - Returns: A binding that can be passed to NavigationStack's path parameter
    func binding(for tab: AppTab) -> Binding<[AnyRouteProtocol]> {
        Binding(
            get: { (router.paths[tab] ?? []).map(AnyRouteProtocol.init) },
            set: { router.paths[tab] = $0.map(\.wrappedValue) }
        )
    }
}

#Preview {
    TabRootView(tab: .profile)
}
