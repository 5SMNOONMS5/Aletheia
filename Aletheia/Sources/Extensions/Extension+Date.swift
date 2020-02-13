//
//  Aletheia
//
//  Created by Stephen Chen on 02/09/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import Foundation

extension Date: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Date {
    
    /// Convert given date into given format.
    ///
    /// - Parameter format: date format, default is "yyyy-MM-dd HH:mm:ss"
    /// - Return: String
    public func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: base)
    }
}
