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
    
    public func utf8() -> String {
        return String(bytes: base, encoding: .utf8) ?? "Data 轉 字串失敗"
    }
}


