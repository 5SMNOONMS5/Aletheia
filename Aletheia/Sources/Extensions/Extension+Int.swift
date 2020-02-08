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
    
    /// Int to CGFloat
    public var toCGFloat: CGFloat { return CGFloat(base) }

    ///  Int to Double
    public var toDouble: Double { return Double(base) }
}
