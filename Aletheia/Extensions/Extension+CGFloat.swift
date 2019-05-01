//
//  Aletheia
//
//  Created by Stephen Chen on 8/23/16.
//  Copyright © 2016 Stephen Chen. All rights reserved.
//

import UIKit

///  使用前請先看過
/// CGFloat 其實就只是一個 typedef for float 在 32
/// 位元的系統 for double 在 64 位元的系統，會有
/// CGFloat 是因為可以讓開發者可以更方便的去開發而不用
/// 管什麼現在的系統是什麼位元，不過現在的 Mac 大部分都
/// 是 64位元居多，包含大部分的應用層以及核心，所以盡量用 double
/// 
/// 可以[參考](https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaTouch64BitGuide/Introduction/Introduction.html)
extension CGFloat: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == CGFloat {
    
	/// Radian value of degree input.
	public var degreesToRadians: CGFloat {
		return CGFloat(Double.pi) * base / 180.0
	}
}
