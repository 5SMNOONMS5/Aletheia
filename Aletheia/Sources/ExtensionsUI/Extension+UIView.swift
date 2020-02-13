//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//


#if os(iOS)

import UIKit

extension AletheiaWrapper where Base: UIView {
    
    /// Infinitly rotate
    public func doRotateInfinitly() {
        let rotation : CABasicAnimation =
            CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        base.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    /// Remove all subviews
    public func removeAllSubViews() {
        base.subviews.forEach({$0.removeFromSuperview()})
    }
    
    /// Convert current view into UIWindows Coordinate
    ///
    /// - Return: CGRect base on the UIWindows Coordinate
    public func toWindowCoordinate() -> CGRect {
        return base.convert(base.bounds, to: UIApplication.shared.keyWindow)
    }
}

#endif
