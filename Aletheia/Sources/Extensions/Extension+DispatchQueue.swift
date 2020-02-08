//
//  Aletheias
//
//  Created by Stephen Chen on 27/2/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'FileManager' can benefit from it
extension AletheiaWrapper where Base == DispatchQueue {
    
    /// Dealy
    ///
    /// - Parameters:
    ///   - seconds: how much time to frozen the main thread
    ///   - completion: when forzen is finish
    static func delayMainThread(with seconds: Double,
                                 completion: @escaping () -> ()) {
        Base.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
