//
//  Aletheias
//
//  Created by Stephen Chen on 16/2/2017.
//  Copyright © 2018 fcloud. All rights reserved.
//

import UIKit

extension NSObject: AletheiaCompatible { }
extension AletheiaWrapper where Base == NSObject {
    
    /// Get string name of class
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// MyClass.className   //=> "MyClass"
    ///
    /// ```
    public var className: String {
        return String(describing: self)
    }
}



