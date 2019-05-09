//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit
import Alamofire

extension String: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == String {
    
    /// 取得當前 字串的長度
    ///
    /// - Parameter font: 字體的大小
    /// - Returns: 字串的長度
    public func width(fontSize size: CGFloat) -> CGFloat {
        return base.size(withAttributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: size)]).width
    }
    
    /// 取得當前 字串的高度
    ///
    /// - Parameter fontSize: 字體的大小
    /// - Returns: 字串的長度
    public func height(fontSize size: CGFloat) -> CGFloat {
        return base.size(withAttributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: size)]).height
    }
    
    /// Convert into int type
    public var intType: Int? { return Int(base) }
    
    /// Convert String into Date type
    ///
    /// - Parameter format: string format
    /// - Returns: new date with given format
    public func dateType(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: base)
    }
    
    /// Valid given string is a correct email format
    ///
    /// - Returns: Bool
    public func isValidEmail() -> Bool {
        let reqularExpress = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: base)
    }
}





