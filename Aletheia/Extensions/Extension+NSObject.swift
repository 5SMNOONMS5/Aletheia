//
//  Aletheias
//
//  Created by Stephen Chen on 16/2/2017.
//  Copyright © 2018 fcloud. All rights reserved.
//

import UIKit

extension NSObject: AletheiaCompatible { }
extension AletheiaWrapper where Base == NSObject {
    
    /// Convience way to declare a nib file
    ///
    /// - parameter name  : name of the Nib
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// let registeredNib = withNib(name: "Nib Name Here")
    ///
    /// ```
    public func nib(name: String) -> UINib {
        return UINib(nibName: name, bundle: nil)
    }
    
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
    
    static var className: String {
        return String(describing: self)
    }
}
