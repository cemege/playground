//
//  HomeView.swift
//  Features
//
//  Created by Cem Ege on 25.11.2024.
//

import SwiftUI
import Router

public struct HomeView: View {
    
    @Environment(Router.self) var router
    
    // MARK: - init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: 64) {
            Text("Home View")
                .font(.largeTitle)
                
            Text("Tap to Home List View")
                .font(.headline)
                .onTapGesture {
                    router.navigate(to: .homeList, tab: .home)
                }
            
            Text("Move to Profile")
                .font(.headline)
                .onTapGesture {
                    router.move(to: .profile, destination: .profileSettings)
                }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
