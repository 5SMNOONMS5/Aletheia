//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

extension String: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == String {
    
    /// Return the width of given string with the given UIFont.
    ///
    /// - Parameter font: UIFont
    /// - Return: String width
    public func width(fontSize font: UIFont) -> CGFloat {
        return size(fontSize: font).width
    }
    
    /// Return the height of given string with the given UIFont.
    ///
    /// - Parameter font: UIFont
    /// - Return: String height
    public func height(fontSize font: UIFont) -> CGFloat {
        return size(fontSize: font).height
    }
    
    /// Return the size of given string with the given UIFont.
    ///
    /// - Parameter font: UIFont
    /// - Return: CGSize
    public func size(fontSize font: UIFont) -> CGSize {
        return base.size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    /// To int type.
    public var toInt: Int? {
        return Int(base)
    }
    
    /// To base 64 encoded
    ///
    /// - Return: String?
    public func toBase64Encoded() -> String? {
        if let data = base.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }

    /// To Date type via given Date
    ///
    /// - Parameter format: Date string format, default is `"yyyy-MM-dd HH:mm:ss"`
    /// - Return: Date?
    public func toDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: base)
    }
    
    /// Check and then convert if given string is a vaild URL
    ///
    /// - Return: URL?
    public func toURL() -> URL? {
        if let aURL = URL(string: base), UIApplication.shared.canOpenURL(aURL)  {
            return aURL
        }
        return nil
    }
    
    /// Is valid e-mail format ?
    ///
    /// - Return: Bool
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: base)
    }
    
    /// To NSAttributed html string
    ///
    /// - Return: NSAttributedString?
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

    /// To html string.
    ///
    /// - Return: NSAttributedString?
    public var toHTMLString: String {
        return toHtmlNSAttributedString?.string ?? ""
    }
    
    /// To new string date format.
    ///
    /// - Parameter newFormat: Old format wants to be converted.
    /// - Parameter oldFormat: New format will be convert.
    ///
    /// - Return: String?
    public func toDateStringFormat(_ newFormat: String, oldFormat: String) -> String? {
        if let date = self.toDate(format: oldFormat) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = newFormat
            return dateFormatter.string(from: date)
        }
        return nil
    }
}





