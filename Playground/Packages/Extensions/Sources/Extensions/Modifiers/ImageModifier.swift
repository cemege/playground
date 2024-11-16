//
//  ImageExtension.swift
//  Extensions
//
//  Created by Cem Ege on 16.11.2024.
//

import SwiftUI
import Kingfisher

public extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}

public extension KFImage {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}
