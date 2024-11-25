//
//  SearchResultView.swift
//  Features
//
//  Created by Cem Ege on 25.11.2024.
//

import SwiftUI

public struct SearchResultView: View {
    
    // MARK: - init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        VStack {
            Text("Search Result")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    SearchResultView()
}
