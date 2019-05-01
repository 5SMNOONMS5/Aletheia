//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

#if os(iOS)

import UIKit

extension UIButton: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == UIButton {
    
    /// concise way to declare button background image
    ///
    /// - Parameter name: Name of image
    public func setBackgroundImage(name: String) {
        base.setBackgroundImage(UIImage(named: name), for: UIControl.State.normal)
    }
}
    
#endif
