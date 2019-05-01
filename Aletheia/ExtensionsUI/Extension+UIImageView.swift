//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//


import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'UIImageView' can benefit from it
extension AletheiaWrapper where Base == UIImageView {
    
    /// 高效能的設置圓角
    ///
    /// cf. https://bestswifter.com/efficient-rounded-corner/
    ///
    /// - Parameter radius: radius for images
    public func addCorner(radius: CGFloat) {
        guard let `image` = base.image else { return }
        base.image = `image`.al.drawRectWithRoundedCorner(radius: radius, base.bounds.size)
    }
}
