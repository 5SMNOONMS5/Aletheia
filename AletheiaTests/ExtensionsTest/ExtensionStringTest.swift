//
//  ExtensionStringTest.swift
//  AletheiaTests
//
//  Created by stephen on 2019/4/11.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import XCTest
@testable import Aletheia

class ExtensionStringTest: XCTestCase {

    var string = "String"

    func test_get_text_width_and_height() {
        let height = string.al.height(fontSize: UIFont.systemFont(ofSize: 14.0))
        let width = string.al.width(fontSize: UIFont.systemFont(ofSize: 14.0))
        XCTAssertNotNil(height)
        XCTAssertNotNil(width)
    }
}
