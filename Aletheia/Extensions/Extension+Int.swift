//
//  public extension+Int.swift
//  GCFramework
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2017 fcloud. All rights reserved.
//

import UIKit

/// Int 的擴充 方法 以及 參數
extension AletheiaWrapper where Base == Int {
    
    /// 轉型： 從 Int 到 CGFloat
    public var CGFloatType: CGFloat { return CGFloat(base) }
    
    /// 轉型： 從 Int 到 Double
    public var DoubleType: Double { return Double(base) }
    
    ///
    /// Convert number into currency model
    ///
    /// - parameter number  : an number to be convert
    ///
    /// ### Example
    /// 
    /// ```
    /// 123456      -> 123,456
    ///
    /// 56791231293 -> 567,912,312,93
    /// ```
    ///
    public var insertComman: String {
        
        let character = String(base)
        
        var newCharacter = ""
        
        for (index, char) in character.enumerated() {
            
            if index % 3 == 1
                && index > 0
                && character.count > 3 {
                newCharacter.append(",")
            }
            
            newCharacter.append(char)
        }
        return newCharacter
    }
}
