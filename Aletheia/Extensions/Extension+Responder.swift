//
//  Aletheias
//
//  Created by Stephen Chen on 15/3/2017.
//  Copyright © 2018 fcloud. All rights reserved.
//

import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'UIResponder' can benefit from it
extension AletheiaWrapper where Base == UIResponder {
    
    /// Get response chain through 
    public func responderChain(responder: UIResponder?) {
        guard let responder = responder else { return }
        responderChain(responder: responder.next)
    }
}
