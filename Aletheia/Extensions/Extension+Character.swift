//
//  Aletheia
//
//  Created by Stephen Chen on 8/8/16.
//  Copyright © 2016 Stephen Chen. All rights reserved.
//

import Foundation

extension Character: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Character {

	/// Is given character is Emoji or not
    ///
    /// [參考](http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji)
    ///
	public var isEmoji: Bool {
        
		guard let scalarValue = String(base).unicodeScalars.first?.value else { return false }
        
		switch scalarValue {
		case
            0x3030, 0x00AE, 0x00A9,// Special Characters
            0x1D000...0x1F77F,     // Emoticons
            0x2100...0x27BF,       // Misc symbols and Dingbats
            0xFE00...0xFE0F,       // Variation Selectors
            0x1F900...0x1F9FF:     // Supplemental Symbols and Pictographs
			return true
		default:
			return false
		}
	}

    /// Is number or not
	public var isNumber: Bool {
		return Int(String(base)) != nil
	}
}
