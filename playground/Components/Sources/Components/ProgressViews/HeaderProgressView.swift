//
//  HeaderProgressView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//


import SwiftUI
import Extensions

public struct HeaderProgressView: View {
    
    // MARK: - Properties
    @State private var animationProgress: CGFloat = 0
    
    private(set) var type: ProgressThemeType = .blue
    private(set) var title: String = ""
    private(set) var description: String = ""
    private(set) var currentStep: Int = .zero
    private(set) var totalSteps: Int = .zero
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .textModifier(size: 16, weight: .bold)
                
                Text(description)
                    .textModifier()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            CircularProgressView(currentStep: currentStep, totalSteps: totalSteps)
                .type(type)
                .frame(alignment: .trailing)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Component Modifiers
public extension HeaderProgressView {
    func type(_ type: ProgressThemeType) -> Self {
        var copy = self
        copy.type = type
        return copy
    }
    
    func title(_ title: String) -> Self {
        var copy = self
        copy.title = title
        return copy
    }
    
    func description(_ description: String) -> Self {
        var copy = self
        copy.description = description
        return copy
    }
    
    func steps(currentStep: Int, totalSteps: Int) -> Self {
        var copy = self
        copy.currentStep = currentStep
        copy.totalSteps = totalSteps
        return copy
    }
}

#Preview {
    VStack(spacing: 100) {
        HeaderProgressView()
            .type(.blue)
            .title("Yetki belgesi")
            .description("8 haneli yetki belgesi numaranızı yazarak sorgulama yapın.")
            .steps(currentStep: 2, totalSteps: 5)
        
        HeaderProgressView()
            .type(.red)
            .title("Yetki belgesi")
            .description("8 haneli yetki belgesi numaranızı yazarak sorgulama yapın.")
            .steps(currentStep: 2, totalSteps: 5)
    }
}
