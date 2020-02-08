//
//  Helper.swift
//  Aletheia
//
//  Created by stephen on 2019/8/26.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import Log

public func ifLet<T, U>(value: T?,
                 success thenFunc: (T) -> (U),
                 fail elseFunc: () -> (U)) -> U {
    switch value {
    case .some(let x): return thenFunc(x)
    case .none: return elseFunc()
    }
}



extension Logger: AletheiaCompatibleValue { }
