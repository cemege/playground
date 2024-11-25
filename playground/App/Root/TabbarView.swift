//
//  TabbarView.swift
//  playground
//
//  Created by cemegeArabam on 25.11.2024.
//

import SwiftUI
import Extensions
import Router

struct TabbarView: View {
    
    @Environment(Router.self) var router
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                ForEach(AppTab.allCases) { tab in
                    VStack {
                        Image(systemName: tab.icon)
                            .foregroundColor(router.selectedTab == tab ? .blue500 : .gray700)
                        
                        Text(tab.rawValue)
                            .textModifier(size: 11, foregroundStyle: router.selectedTab == tab ? .blue500 : .gray700)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onTapGesture {
                        if router.selectedTab == tab {
                            router.popToRoot(for: tab)
                        }
                        router.selectedTab = tab
                    }
                }
            }
        }
        .padding(8)
        .background(.ultraThinMaterial)
    }
}
