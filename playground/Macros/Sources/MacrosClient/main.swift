//
//  main.swift
//  Macros
//
//  Created by Cem Ege on 23.02.2025.
//

import Macros

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")
