//
//  Aletheias
//
//  Created by Stephen Chen on 16/2/2017.
//  Copyright © 2018 fcloud. All rights reserved.
//

import UIKit

extension NSObject: AletheiaCompatible { }
extension AletheiaWrapper where Base: NSObject {
    
    /// Get the name of class
    ///
    /// ```swift
    ///
    /// MyClass.al.className   //=> "MyClass"
    ///
    /// ```
    /// - Return: CGFloat
    public var getClassName: String {
        return String(describing: self)
    }
}



