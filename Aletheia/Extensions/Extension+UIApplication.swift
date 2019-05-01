//
//  public Extension+UIApplication.swift
//  Aletheias
//
//  Created by Stephen Chen on 17/3/2017.
//
//

import UIKit

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
    
        guard let url = URL(string: url) else {
            ALPrint(msg: "`URL` cannot be formed with the string", type: .negative)
            return
        }
        
        if !UIApplication.shared.canOpenURL(url) {
            ALPrint(msg: "UIApplication can not open this url => \(url)", type: .negative)
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    /// Convert given view origin (x, y) to key window coordinate
    ///
    /// - Parameter sender: the view need to be convert
    /// - Returns: the view in window's coordinate
    public func convertViewToKeyWindowsCoordinate(sender: UIView) -> CGPoint? {
        var point: CGPoint?
        guard let window = UIApplication.shared.keyWindow else { return point }
        guard let superView = sender.superview else { return point }
        point = superView.convert(sender.frame.origin, to: window)
        return point
    }
    
}
