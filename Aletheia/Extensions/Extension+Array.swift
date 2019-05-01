//
//  Aletheia
//
//  Created by Stephen Chen on 8/5/16.
//  Copyright © 2016 Stephen Chen. All rights reserved.
//

import Foundation

extension Array: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Array<Any> {
	
    /// 把 Array 內部元素全部洗牌一次
    public var shuffle: [Any] {

        var list = base

        for index in 0..<list.count {
            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index

            if index != newIndex {
                list.swapAt(index, newIndex)
            }
        }
        
        return list
    }
}
