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
        
        NavigationStack(path: $router[tab]) {
            tab.rootView
                .navigationDestination(for: RouterDestination.self) { destination in
                    switch destination {
                    case .homeList:
                        HomeListView()
                        
                    case .searchResult:
                        SearchResultView()
                        
                    case .profileSettings:
                        ProfileSettingsView()
                    }
                }
                .environment(\.currentTab, tab)
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

#Preview {
    TabRootView(tab: .profile)
}
