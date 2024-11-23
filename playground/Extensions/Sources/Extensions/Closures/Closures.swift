//
//  Closures.swift
//  Extensions
//
//  Created by Cem Ege on 18.09.2024.
//

import Foundation

public typealias EmptyClosure = (() -> Void)
public typealias IntClosure = ((Int) -> Void)
public typealias DoubleClosure = ((Double) -> Void)
public typealias FloatClosure = ((Float) -> Void)
public typealias BoolClosure = ((Bool) -> Void)
public typealias StringClosure = ((String) -> Void)
public typealias DecodableClosure<T: Decodable> = ((T) -> Void)
public typealias AnyClosure<T: Any> = ((T) -> Void)
public typealias NullableAnyClosure<T: Any> = ((T?) -> Void)
public typealias DateClosure = ((Date) -> Void)
