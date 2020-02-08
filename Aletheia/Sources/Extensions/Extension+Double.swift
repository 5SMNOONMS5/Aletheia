//
//  Aletheia
//
//  Created by Stephen Chen on 8/6/16.
//  Copyright © 2016 Stephen Chen. All rights reserved.
//

import UIKit

extension Double: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Double {
        
    /// Convert from degrees to radians
    public var degreesToRadians: Double {
        return Double.pi * base / 180.0
    }
    
    /// Convert from radians to degrees
    public var radiansToDegrees: Double {
        return base * 180 / Double.pi
    }
}

