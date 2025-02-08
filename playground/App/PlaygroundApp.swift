//
//  PlaygroundApp.swift
//  Playground
//
//  Created by Cem Ege on 14.09.2024.
//

import SwiftUI
import Extensions
import Network
import Router

@main
struct PlaygroundApp: App {
    
    // MARK: - Properties
    @State var router: Router = .init()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $router.selectedTab) {
                ForEach(AppTab.allCases) { tab in
                    TabRootView(tab: tab)
                        .tag(tab)
                }
            }
            .environment(router)
            .overlay(alignment: .bottom) {
                TabbarView()
                    .environment(router)
                    .ignoresSafeArea(.keyboard)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}
