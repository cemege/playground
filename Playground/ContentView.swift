//
//  ContentView.swift
//  Playground
//
//  Created by Cem Ege on 14.09.2024.
//

import SwiftUI
import Extensions
import Components

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            CircularLoadingView()
                .theme(.blue)
            
            Divider()
            
            LineLoadingView()
                .animationColor(.blue500, .blue300)
            
            Divider()
            
            CircularProgressView(currentStep: 3, totalSteps: 5)
                .type(.blue)
            
            Divider()
            
            HeaderProgressView()
                .type(.blue)
                .title("Yetki belgesi")
                .description("8 haneli yetki belgesi numaranızı yazarak sorgulama yapın.")
                .steps(currentStep: 2, totalSteps: 5)
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
