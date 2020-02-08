//
//  public Extension+UIViewController.swift
//  Aletheia
//
//  Created by Stephen Chen on 9/8/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'UIViewController' can benefit from it
extension AletheiaWrapper where Base == UIViewController {

    /// Remove child view controller from parent view controller
    public func removeFromParentViewController() {
        base.willMove(toParentViewController: nil)
        base.view.removeFromSuperview()
        base.removeFromParentViewController()
    }

    /// Add new child view controller
    ///
    /// - Parameter sender: Child ViewController
    public func addChildViewController(sender: UIViewController) {
        base.addChildViewController(sender)
        sender.view.frame = base.view.frame
        base.view.addSubview(sender.view)
        sender.didMove(toParentViewController: base)
    }
}
