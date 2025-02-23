//
//  AccessibilityIdentifierMacro.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftParser

public struct AccessibilityIdentifierMacro: MemberMacro {
    public init() {}
}

public extension AccessibilityIdentifierMacro {
    static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Get all variable declarations in the class
        let members = declaration.memberBlock.members
        var newMembers: [DeclSyntax] = []
        
        for member in members {
            // Check if it's a variable declaration
            guard let varDecl = member.decl.as(VariableDeclSyntax.self) else { continue }
            
            // Process each binding in the variable declaration
            for binding in varDecl.bindings {
                guard let identifier = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier.text,
                      let _ = binding.typeAnnotation?.type.as(IdentifierTypeSyntax.self) else {
                    continue
                }
                
                // Check if the type is UIView or its subclass (will need runtime check)
                let propertyName = identifier
                
                // Create the new property with @AccessibilityWrapper wrapper
                let newProperty = """
                    @AccessibilityWrapper(name: "\(propertyName)")
                    \(varDecl.modifiers.description) \(varDecl.bindingSpecifier.text) \(propertyName)\(binding.typeAnnotation?.description ?? "")\(binding.initializer?.description ?? "")
                    """
                
                newMembers.append(DeclSyntax(stringLiteral: newProperty))
            }
        }
        
        return newMembers
    }
    
    //    public static func expansion(
    //        of node: AttributeSyntax,
    //        providingMembersOf declaration: some DeclGroupSyntax,
    //        in context: some MacroExpansionContext
    //    ) throws -> [DeclSyntax] {
    //        var newMembers: [DeclSyntax] = []
    //
    //        // Loop over the members of the class
    //        for member in declaration.memberBlock.members {
    //            guard var variableDecl = member.decl.as(VariableDeclSyntax.self)
    //            else {
    //                continue
    //            }
    //
    //            // Check if the variable has an @IBOutlet attribute
    //            let hasIBOutlet = variableDecl.attributes.contains { attribute in
    //                if let attributeSyntax = attribute.as(AttributeSyntax.self) {
    //                    return attributeSyntax.attributeName.description.trimmingCharacters(in: .whitespacesAndNewlines) == "IBOutlet"
    //                }
    //                return false
    //            }
    //
    //            // We only process properties that are outlets and are of UIView type
    //            if hasIBOutlet,
    //               let binding = variableDecl.bindings.first,
    //               let propertyName = binding
    //                .pattern
    //                .description
    //                .trimmingCharacters(in: .whitespacesAndNewlines)
    //                .components(separatedBy: CharacterSet.alphanumerics.inverted)
    //                .first {
    //
    //                // Create the new property wrapper attribute with the appropriate name.
    //                // For instance: @AccessibilityWrapper(name: "PriceOfferSelectionVC.garageVehicleContainerView")
    //                let wrapperString = """
    //                @AccessibilityWrapper(name: "\(propertyName)")
    //                """
    //
    //                // Parse the source into a SourceFileSyntax.
    //                let parsedSourceFile = Parser.parse(source: wrapperString)
    //
    //                // Extract the first statement and cast its item to a ClassDeclSyntax.
    //                guard let firstStatement = parsedSourceFile.statements.first,
    //                      let dummyClassDecl = firstStatement.item.as(ClassDeclSyntax.self),
    //                      // Extract the first attribute from the dummy class's attributes.
    //                      let wrapperAttribute = dummyClassDecl.attributes.first?.as(AttributeSyntax.self)
    //                else {
    //                    fatalError("Failed to parse wrapper attribute")
    //                }
    //
    //                // Get the existing attribute list or an empty list.
    //                let currentAttributes = variableDecl.attributes
    //
    //                // Convert the existing list to an array of elements.
    //                var elements = Array(currentAttributes)
    //
    //                // Create a new element from your wrapperAttribute.
    //                // The initializer may vary depending on your SwiftSyntax version.
    //                let newElement = AttributeListSyntax.Element(wrapperAttribute)
    //
    //                // Append the new element.
    //                elements.append(newElement)
    //
    //                // Create a new AttributeListSyntax from the array.
    //                let newAttributeList = AttributeListSyntax(elements)
    //
    //                // Update the variable declaration with the new attribute list.
    //                variableDecl = variableDecl.with(\.attributes, newAttributeList)
    //
    //                // Replace the old member with the new wrapped version
    //                newMembers.append(DeclSyntax(variableDecl))
    //            } else {
    //                newMembers.append(member.decl)
    //            }
    //        }
    //
    //        // Return the modified members
    //        return newMembers
    //    }
}
