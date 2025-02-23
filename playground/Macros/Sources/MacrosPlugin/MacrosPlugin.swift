//
//  MacrosPlugin.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        AccessibilityIdentifierMacro.self
    ]
}
