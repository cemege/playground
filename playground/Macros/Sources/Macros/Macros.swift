//
//  Macros.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "MacrosPlugin", type: "StringifyMacro")

/// A macro that automatically attaches an accessibility outlet wrapper
/// to all IBOutlets in a type. When applied to a view controller or similar
/// declaration, this macro inspects each member and, if it finds a property
/// marked with @IBOutlet (and whose type is a UIView), it wraps the outlet with
/// an @AccessibilityWrapper property wrapper. The generated wrapper uses a naming
/// convention that combines the containing type’s name and the property’s name,
/// for example:
///
///     @AccessibilityWrapper(name: "UIViewController.containerView")
///     @IBOutlet private weak var containerView: UIView!
///
/// This macro helps automate the consistent assignment of accessibility
/// identifiers to UI elements, reducing boilerplate code and potential errors.
@attached(member)
public macro AccessibilityIdentifierMacro() = #externalMacro(module: "MacrosPlugin", type: "AccessibilityIdentifierMacro")
