//
//  Aletheia
//
//  Created by Stephen Chen on 02/09/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import Foundation

extension Date: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Date {
    
    /// Convert Date into String
    ///
    /// - Parameter format: date format
    /// - Returns: new string with given format
    public func stringType(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: base)
    }
}
