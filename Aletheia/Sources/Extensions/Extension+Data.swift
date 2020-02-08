//
//  public extension+Data.swift
//  GCFramework
//
//  Created by StephenChen on 02/09/2017.
//  Copyright © 2017 fcloud. All rights reserved.
//

import Foundation

extension Data: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == Data {
    
    public func toString(encoding: String.Encoding = .utf8) -> String? {
        return String(bytes: base, encoding: encoding)
    }
    
    /// decode data into given object that confrims to Decodable
    ///
    /// - Parameter type: Parameter T: A object confrims to Decodable
    /// - Parameter decoder: Custom decoder
    public func toJson<T: Decodable>(type: T.Type, decoder: JSONDecoder? = nil) -> T? {
        
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



