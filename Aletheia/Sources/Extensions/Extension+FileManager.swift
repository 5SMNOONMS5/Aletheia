//
//  Aletheia
//
//  Created by stephen on 2018/7/12.
//  Copyright © 2018 fcloud. All rights reserved.
//

import Foundation

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'FileManager' can benefit from it
extension AletheiaWrapper where Base == FileManager {
    
    public var documentDirectories: String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
    
    public var cachesDirectories: String {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
}
