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
extension AletheiaWrapper where Base == UIApplication {
    
    /// 拿到目前應用程式當前的 ViewController，透過遞迴方式取得
    ///
    /// - parameter base: 默認是 rootViewController，然後一層層往上搜尋
    ///
    /// - Returns: 當前在最上層的 ViewController
    public func toppestViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController {
            return toppestViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return toppestViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return toppestViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return toppestViewController(base: presented)
        }
        return base
    }
    
    /// Detect whether application can open URL or not
    ///
    /// - Parameter url: url
    public func openURL(with url: String) {
    
        guard let aURL = URL(string: url) else {
            Logger().error("\(url) cannot be formed with the string")
            return
        }
        
        if !UIApplication.shared.canOpenURL(aURL) {
            Logger().error("UIApplication can't open => \(aURL)")
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(aURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(aURL)
        }
    }
    
    /// Convert given view origin (x, y) to key window coordinate
    ///
    /// - Parameter sender: the view need to be convert
    /// - Returns: the view in window's coordinate
    public func toKeyWindowsCoordinate(sender: UIView) -> CGPoint? {
        var point: CGPoint?
        guard let window = UIApplication.shared.keyWindow else { return point }
        guard let superView = sender.superview else { return point }
        point = superView.convert(sender.frame.origin, to: window)
        return point
    }
    
    /// Get status bar
    public var statusBarView: UIView? {
        return base.value(forKey: "statusBar") as? UIView
    }
    
    /// Get status bar
    public var statusBarUIView: UIView? {
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
