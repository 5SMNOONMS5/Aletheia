//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//


import UIKit

extension CALayer: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == CALayer {
    
    /// Add borders with given array
    ///
    /// - Parameters:
    ///   - edges: specific border to add
    ///   - color: current now only support one side border
    ///   - thickness: the width of border
    public func addBorder(edges: [UIRectEdge], color: UIColor, thickness: CGFloat) {
        
        if edges.contains(.all) {
            base.borderWidth = thickness
            base.borderColor = color.cgColor
            return
        }
        
        let path = UIBezierPath()
        let width = base.frame.width
        let height = base.frame.height
        
        for edge in edges {
            
            switch edge {
            case UIRectEdge.top:
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: 0))
            case UIRectEdge.bottom:
                path.move(to: CGPoint(x: 0, y: height))
                path.addLine(to: CGPoint(x: width, y: height))
            case UIRectEdge.left:
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: height))
            case UIRectEdge.right:
                path.move(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: width, y: height))
            default:
                break
            }
            
            path.close()
            
            /// make a border layer
            let borderLayer = CAShapeLayer()
            
            borderLayer.path = path.cgPath
            borderLayer.lineWidth = thickness
            borderLayer.strokeColor = color.cgColor
            base.addSublayer(borderLayer)
        }
    }
}
