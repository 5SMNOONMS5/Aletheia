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
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_get_text_width_and_height() {
        let height = string.al.height(fontSize: 10.0)
        let width = string.al.width(fontSize: 10.0)
    }
}
