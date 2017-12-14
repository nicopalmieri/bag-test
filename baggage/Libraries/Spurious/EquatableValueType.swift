//
//  EquatableValueType.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/14/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

public protocol EquatableValueType {
    func isEqualTo(value: Any) -> Bool
    func getValue<U: Equatable>() -> U
}

public enum Argument {
    case Anything
}

prefix operator <-

public prefix func <-<T: Equatable>(eq: T) -> EquatableValue<T> {
    return EquatableValue(eq)
}

public func with<T: Equatable>(value: T) -> EquatableValue<T> {
    return EquatableValue(value)
}

public func and<T: Equatable>(value: T) -> EquatableValue<T> {
    return EquatableValue(value)
}

// The following warnings (4) are addresed as Swift-bugs 'emselves
/// https://bugs.swift.org/browse/SR-6265
public func ==<T: Equatable>(lhs: EquatableValue<T>, rhs: EquatableValue<T>) -> Bool {
    return lhs.value == rhs.value
}

public func ==<T: Equatable>(lhs: T, rhs: EquatableValue<T>) -> Bool {
    return lhs == rhs.value
}

public func ==<T: Equatable>(lhs: EquatableValue<T>, rhs: Argument) -> Bool {
    return lhs.value is Argument && lhs.value as? Argument == Argument.Anything && rhs == Argument.Anything
}

public func ==<T: Equatable>(lhs: EquatableValue<T>, rhs: T) -> Bool {
    return lhs.value == rhs
}

public class EquatableValue<T: Equatable>: EquatableValueType, Equatable {
    var value: T

    public init(_ value: T) {
        self.value = value
    }

    public func getValue<U: Equatable>() -> U {
        //swiftlint:disable:next force_cast
        return self.value as! U
    }

    public func isEqualTo(value: Any) -> Bool {
        if self == Argument.Anything {
            return true
        }
        if let anyValue: T = value as? T {
            return self.value == anyValue
        }
        return false
    }
}
