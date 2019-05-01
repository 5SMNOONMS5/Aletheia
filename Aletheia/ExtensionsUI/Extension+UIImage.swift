//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'UIImage' can benefit from it
extension AletheiaWrapper where Base == UIImage {
    
    /// 高效能的設置圓角
    ///
    /// cf. https://bestswifter.com/efficient-rounded-corner/
    ///
    /// - Parameters:
    ///   - radius: radius
    ///   - sizetoFit: size
    /// - Returns: UIImage with given radius corner
    public func drawRectWithRoundedCorner(radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius))
        
        context?.addPath(path.cgPath)
        context?.clip()
        
        base.draw(in: rect)
        
        context?.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return output!
    }
}
