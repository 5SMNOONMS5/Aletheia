//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

extension String: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == String {
    
    /// 取得當前 字串的寬度
    ///
    /// - Parameter font: 字體
    /// - Returns: 寬度
    public func width(fontSize font: UIFont) -> CGFloat {
        return base.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
    
    /// 取得當前 字串的長度
    ///
    /// - Parameter font: 字體
    /// - Returns: 長度
    public func height(fontSize font: UIFont) -> CGFloat {
        return base.size(withAttributes: [NSAttributedString.Key.font: font]).height
    }
    
    /// 取得當前 字串大小
    ///
    /// - Parameter font: 字體
    /// - Returns: 大小
    public func size(fontSize font: UIFont) -> CGSize {
        return base.size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    /// Convert into int type
    public var toInt: Int? { return Int(base) }
    
    /// Convert String into Date type
    ///
    /// - Parameter format: string format
    /// - Returns: new date with given format
    public func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: base)
    }
    
    /// Cut decimal for those price-like strings. For example from 1000.000 to 1000
    ///
    /// - Returns: no decimal string
    public func withoutDecimal() -> String? {
        if let subString = base.split(separator: ".").first {
            return String(subString)
        }
        return nil
    }
    
    /// Check if given string is a vaild URL format
    ///
    /// - Returns: Bool
    public func toURL() -> URL? {
        if let aURL = URL(string: base), UIApplication.shared.canOpenURL(aURL)  {
            return aURL
        }
        return nil
    }
    
    /// Is string a valid Email format ?
    ///
    /// - Returns: Bool
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: base)
    }
    
    /// Base 64 encode
    ///
    /// - Returns: String?
    public func base64Encoded() -> String? {
        if let data = base.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }

    /// Base 64 decode
    ///
    /// - Returns: String?
    public func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: base) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// To NSAttributed HTML String
    public var toHtmlNSAttributedString: NSAttributedString? {
        guard
            let data = base.data(using: .utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
    /// HTML String
    public var toHTMLString: String {
        return toHtmlNSAttributedString?.string ?? ""
    }
    
    /// To new string date format
    ///
    /// - Parameter format: Date string format, default is `yyyy-MM-dd`
    public func toDateStringFormat(_ format: String = "yyyy-MM-dd") -> String? {
        if let date = self.toDate(format: format) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
        return nil
    }
}





