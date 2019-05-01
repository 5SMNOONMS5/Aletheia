//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//


#if os(iOS)

import UIKit

extension AletheiaWrapper where Base == UIView {
    
    /// Infinitly rotate
    public func rotateInfinitly() {
        let rotation : CABasicAnimation =
            CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        base.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    /// SwifterSwift: Remove all subviews in view.
    public func removeAllSubViews() {
        base.subviews.forEach({$0.removeFromSuperview()})
    }
    
    /// Get first response ParentViewController
    public var firstResponseViewController: UIViewController? {
        var parentResponder: UIResponder? = base
        while parentResponder != nil
        {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

#endif
