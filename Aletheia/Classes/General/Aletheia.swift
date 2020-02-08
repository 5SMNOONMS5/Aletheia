//
//  Aletheia.swift
//  Aletheia
//
//  Created by stephen on 2019/4/11.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import Foundation

/// Wrapper for Aletheia compatible types. This type provides an extension point for
/// connivence methods in Aletheia.
public struct AletheiaWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// Represents an object type that is compatible with Aletheia. You can use `al` property to get a
/// value in the namespace of Aletheia.
public protocol AletheiaCompatible: AnyObject { }

extension AletheiaCompatible {
    /// Gets a namespace holder for Aletheia compatible types.
    public var al: AletheiaWrapper<Self> {
        get { return AletheiaWrapper(self) }
        set { }
    }
}

/// Represents a value type that is compatible with Aletheia. You can use `al` property to get a
/// value in the namespace of Aletheia.
public protocol AletheiaCompatibleValue {}

extension AletheiaCompatibleValue {
    /// Gets a namespace holder for Aletheia compatible types.
    public var al: AletheiaWrapper<Self> {
        get { return AletheiaWrapper(self) }
        set { }
    }
}

/// Represents a reference type that is compatible with Aletheia. You can use `al` property to get a
/// value in the namespace of Aletheia.
public protocol AletheiaCompatibleReference {}

extension AletheiaCompatibleReference {
    /// Gets a namespace holder for Aletheia compatible types.
    public var al: AletheiaWrapper<Self> {
        get { return AletheiaWrapper(self) }
        set { }
    }
}

