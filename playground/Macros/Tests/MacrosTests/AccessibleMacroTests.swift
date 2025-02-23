//
//  AccessibleMacroTests.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

import XCTest
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import Macros

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling.
// Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(MacrosPlugin)
import MacrosPlugin
let accessibleMacros: [String: Macro.Type] = [
    "Accessible": AccessibleMacro.self
]
#endif

final class AccessibleMacroTests: XCTestCase {
    func testAccessibleMacro() throws {
    #if canImport(MacrosPlugin)
        assertMacroExpansion(
            """
            @Accessible
            final class TestViewController: UIViewController {
                @IBOutlet var testLabel: UILabel!
                let testView = UIView()
            }
            """,
            expandedSource: """
            final class TestViewController: UIViewController {
                @AccessibilityWrapper(name: "testLabel")
                @IBOutlet var testLabel: UILabel!
                @AccessibilityWrapper(name: "testView")
                let testView = UIView()
            }
            """,
            macros: accessibleMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
