//
//  RateView.swift
//  Components
//
//  Created by Cem Ege on 18.11.2024.
//

import SwiftUI
import Extensions

public struct RateView: View {
    
    // MARK: - Properties
    private(set) var rate: String = ""
    private(set) var rateColor: Color = .blue500
    private(set) var icon: String = "garageBlueEmptyStarIcon"
    private(set) var backgroundColor: Color = .blue100
    
    public init() {}
    
    // MARK: - Body
    public var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(icon)
                .imageModifier()
                .frame(width: 12, height: 12)
            
            Text(rate)
                .textModifier(size: 11, foregroundStyle: rateColor)
        }
        .padding(6)
        .background(backgroundColor)
        .roundedCorners()
    }
}

// MARK: - Builders
public extension RateView {
    func rate(_ rate: String) -> RateView {
        var copy = self
        copy.rate = rate
        return copy
    }
    
    func rateColor(_ rateColor: Color) -> RateView {
        var copy = self
        copy.rateColor = rateColor
        return copy
    }
    
    func icon(_ icon: String) -> RateView {
        var copy = self
        copy.icon = icon
        return copy
    }
    
    func backgroundColor(_ backgroundColor: Color) -> RateView {
        var copy = self
        copy.backgroundColor = backgroundColor
        return copy
    }
}

#Preview {
    RateView()
        .rate("4.2")
        .icon("garageBlueEmptyStarIcon")
        .backgroundColor(.blue500)
}
