//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'Data' can benefit from it
extension AletheiaWrapper where Base == Data {
    
    /// decode data into given object that confrims to Decodable
    ///
    /// - Parameter type: Parameter T: A object confrims to Decodable
    /// - Parameter decoder: Custom decoder
    public func jsonType<T: Decodable>(type: T.Type, decoder: JSONDecoder? = nil) -> T? {
        
        var _decoder: JSONDecoder
        
        if let decoder = decoder {
            _decoder = decoder
        } else {
            _decoder = JSONDecoder()
            _decoder.keyDecodingStrategy = .convertFromSnakeCase
        }
        
        guard let result = try? _decoder.decode(T.self, from: base) else { return nil }
        return result
    }
}
