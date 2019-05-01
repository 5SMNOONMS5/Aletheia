//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//


import UIKit

public protocol JSONDecodablePeorocol {
    
    associatedtype ResponseStruct
    
    /// 解析 Json 格式
    ///
    /// - Parameter data: 網路 response 的回傳 data
    ///
    /// - Returns: 回傳泛型的 ResponseStruct
    func parseJSON(data: Data) -> ResponseStruct
}

public protocol JSONConvertibleProtocol {
    
    /// 轉換 Json 格式 到 ResponseType
    ///
    /// - Parameter T: A object confrims to Decodable
    ///
    /// - Returns: T
    func jsonType<T: Decodable>(type: T.Type, decoder: JSONDecoder?) -> T?
}

/// NSObject haa been conform to protocol 'AletheiaCompatible',
/// so 'Data' can benefit from it
extension AletheiaWrapper: JSONConvertibleProtocol where Base == Data {
    
    public func jsonType<T: Decodable>(type: T.Type, decoder: JSONDecoder? = nil) -> T? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode(T.self, from: base) else {
            return nil
        }
        
        return result
    }
}
