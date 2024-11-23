//
//  PlaygroundApp.swift
//  Playground
//
//  Created by Cem Ege on 14.09.2024.
//

import SwiftUI
import Network
import Router

@main
struct PlaygroundApp: App {
    
    // MARK: - Properties
    let client = Client.shared
    
    @State var router: Router = .init()
    
    var body: some Scene {
        WindowGroup {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(AppTab.allCases) { tab in
                        TabRootView(tab: tab)
                            .id(tab)
                    }
                }
                .scrollTargetLayout()
                .environment(\.client, client)
                .environment(router)
            }
        }
    }
}
