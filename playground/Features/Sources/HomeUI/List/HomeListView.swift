//
//  HomeListView.swift
//  Features
//
//  Created by Cem Ege on 25.11.2024.
//

import SwiftUI
import Router

public struct HomeListView: View {
    
    @Environment(Router.self) var router
    
    // MARK: - init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        VStack {
            Text("HomeListView")
                .font(.largeTitle)
                .onTapGesture {
                    router.popToRoot(for: .home)
                }
        }
        .padding()
    }
}

#Preview {
    HomeListView()
}
