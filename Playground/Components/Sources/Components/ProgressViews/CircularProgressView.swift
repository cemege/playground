//
//  CircularProgressView.swift
//  Components
//
//  Created by Cem Ege on 16.11.2024.
//


import SwiftUI
import Extensions

public struct CircularProgressView: View {

    // MARK: - Properties
    @State private var animationProgress: CGFloat = 0
    
    private(set) var type: ProgressThemeType = .blue
    
    public let currentStep: Int
    public let totalSteps: Int
    
    private var progress: CGFloat {
        CGFloat(currentStep) / CGFloat(totalSteps)
    }
    
    // MARK: - Init
    public init(currentStep: Int, totalSteps: Int) {
        self.currentStep = currentStep
        self.totalSteps = totalSteps
    }
    
    // MARK: - Body
    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray400, lineWidth: 5)
                .frame(width: 48, height: 48)
            
            Circle()
                .trim(from: 0, to: animationProgress)
                .stroke(animationProgress > 0 ? type.color : Color.clear, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 48, height: 48)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: animationProgress)
            
            Text("\(currentStep) / \(totalSteps)")
                .textModifier(size: 10, weight: .bold, foregroundStyle: type.color)
        }
        .frame(width: 48, height: 48)
        .onAppear {
            animationProgress = progress
        }
        .onChange(of: progress) { oldValue, newValue in
            animationProgress = newValue
        }
    }
}

// MARK: - Component Modifiers
public extension CircularProgressView {
    func type(_ type: ProgressThemeType) -> Self {
        var copy = self
        copy.type = type
        return copy
    }
}

#Preview {
    HStack(spacing: 20) {
        CircularProgressView(currentStep: 1, totalSteps: 5)
            .type(.red)
        
        CircularProgressView(currentStep: 3, totalSteps: 5)
            .type(.blue)
    }
    .padding()
}
