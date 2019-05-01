//
//  Extension+URL.swift
//  Aletheia
//
//  Created by stephen on 2019/4/12.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import Foundation

extension URL: AletheiaCompatibleValue { }
extension AletheiaWrapper where Base == URL {
    
    /// Get url query value via key
    ///
    /// If the URL is **http://www.google.com?AAAA=1111&BBBB=2222&CCCC=3333**, then give **AAAA** as key, its return **1111** .then give **BBBB** as key, its return **2222**.
    ///
    /// - Parameters:
    ///   - aURL: url string
    ///   - key: a string key
    /// - Returns: correspond value via given key
    public func getQueryItem(aURL: String?, key: String) -> String? {
        
        guard let aURLString = aURL else { return nil }
        
        let queryItems = URLComponents(string: aURLString)?.queryItems
        let param = queryItems?.filter({$0.name == key}).first
        
        return param?.value
    }
    
    /// Add parameter after URL components
    ///
    /// If the key is **AAAA** and value is **1111**, URL **http://www.google.com** will become **http://www.google.com?AAAA=1111**. If the URL is **http://www.google.com?BBBB=2222**, then will generate as **http://www.google.com?BBBB=2222&AAAA=1111**
    ///
    /// - Parameters:
    ///   - aURL: a URL for add
    ///   - key: the key of the components
    ///   - value: the value of the components
    /// - Returns: a URL after shaped
    public func addQueryItem(aURL: String?, key: String, value: String?) -> String? {
        
        guard let aURL = aURL else { return nil }
        guard let value = value else { return aURL }
        
        let query = URLComponents(string: aURL)?.queryItems?.count
        
        return (query == nil) || (query == 0)
            ? aURL + "?" + key + "=" + value
            : aURL + "&" + key + "=" + value
    }

}
