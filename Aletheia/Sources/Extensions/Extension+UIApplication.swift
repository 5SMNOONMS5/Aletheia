//
//  public Extension+UIApplication.swift
//  Aletheias
//
//  Created by Stephen Chen on 17/3/2017.
//
//

import Log
import UIKit
import Foundation

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'UIApplication' can benefit from it
extension AletheiaWrapper where Base: UIApplication {
        
    /// Get top most UIViewController
    ///
    /// - parameter base: Current rootViewController of keyWindow.
    /// - Return: UIViewController
    public func getToppestViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController {
            return getToppestViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return getToppestViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return getToppestViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return getToppestViewController(base: presented)
        }
        return base
    }
    
    /// Open the specified URL asynchronously.
    ///
    /// - Parameter url: url
    public func doOpenURL(with url: String) {
    
        guard let aURL = url.al.toURL() else {
            Logger().error("\(url) cannot be formed with the string")
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(aURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(aURL)
        }
    }
    
    /// Convert given view origin (x, y) into key window coordinate.
    ///
    /// - Parameter sender: The view needed to be convert
    /// - Return: The view in window's coordinate
    public func getKeyWindowsCoordinate(sender: UIView) -> CGPoint? {
        var point: CGPoint?
        guard let window = UIApplication.shared.keyWindow else { return point }
        guard let superView = sender.superview else { return point }
        point = superView.convert(sender.frame.origin, to: window)
        return point
    }
    
    /// Get status bar
    ///
    /// - Return: UIView?
    public var getStatusBar: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 1231415
            if let statusBar = base.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                base.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            let statusBar = "statusBar"
            if base.responds(to: Selector((statusBar))) {
                return base.value(forKey: statusBar) as? UIView
            }
        }
        return nil
    }
    

}
