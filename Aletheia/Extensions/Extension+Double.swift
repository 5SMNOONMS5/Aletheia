//
//  Aletheia
//
//  Created by Stephen Chen on 8/6/16.
//  Copyright © 2016 Stephen Chen. All rights reserved.
//

import UIKit

extension Double: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Double {
    
    /// 把 角度 轉換成 弧度
    public var degreesToRadians: Double {
        return Double.pi * base / 180.0
    }
    
    /// 把 弧度 轉換成 角度
    public var radiansToDegrees: Double {
        return base * 180 / Double.pi
    }
}

