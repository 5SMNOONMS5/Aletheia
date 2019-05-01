//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import Foundation

/// Print types
///
/// - normal: normal print
/// - highLight: some infos need little attention
/// - negative: some bad infos
/// - destory: when class deinit
/// - custom: custom infos
public enum ALPrintType {
    /// normal print
    case normal
    /// something you think need more attention
    case highLight
    /// something is bad, EX: API JSON parse fail
    case negative
    /// involve inside the deinit function
    case destory
    /// csutom graphic function
    case custom(graph: String)
}

/// Graphical print, works strictly in Release Mode
///
/// - Parameters:
///   - msg: Generics type message, feed me anything.
///   - type: given a type
///   - file: Working file name.
///   - functionName: Working function name.
///   - lineNumber: Working line number of current file.
internal func ALPrint<T>(msg: T,
                       type: ALPrintType = .normal,
                       file: String = #file,
                       functionName: String = #function,
                       lineNumber: Int = #line) {
    var graphicString: String = ""
    
    switch type {
    case .highLight:
        graphicString = "❇️❇️❇️❇️❇️"
    case .negative:
        graphicString = "❌❌❌❌❌"
    case .custom(let graph):
        graphicString = graph
    case .destory:
        print("😎😎😎😎😎 \(msg) Has successfully remove reference and also dealloc from memory")
        return
    case .normal:
        break
    }
    
    print(" \(graphicString) \((file as NSString).lastPathComponent)[\(lineNumber)], \(functionName): \(msg)")
}

