//
//  Aletheia
//
//  Created by StephenChen on 26/08/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import Foundation

/// Dictionary operator with generic methods
///
/// - Parameters:
///   - left: a dictionary
///   - right: new dictionary for apply
public func += <KeyType, ValueType>(left: inout [KeyType: ValueType], right: [KeyType: ValueType]) {
    for (key, value) in right {
        left[key] = value
    }
}
