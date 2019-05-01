//
//  NetworkingClientPutTest.swift
//  AletheiaTests
//
//  Created by stephen on 2019/4/30.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import XCTest
import Aletheia

class NetworkingClientPutTest: XCTestCase, Networkable {
    
    var parameters: [String : Any]? = nil
    
    var baseURL: String = "https://httpbin.org/put"
    
    var networkClient: NetworkClient = NetworkClient()
    
    func start(completion: @escaping Response) {
        let expectation = XCTestExpectation(description: "Test request with http put method from httpbin.org")
        networkClient.performRequest(self) { (response) in
            if let data = response.value as? Data,
                let object = self.parseJSON(data: data) {
                
                print(object)
//                XCTAssertNotNil(object.origin)
//                XCTAssertNotNil(object.url)
            } else {
                fatalError("Parse error")
            }
            expectation.fulfill()
        }
    }
    
    func testRequest() {
        self.start { (_) in
            
        }
    }
}

extension NetworkingClientPutTest: JSONDecodablePeorocol {
    
    typealias ResponseStruct = HttpbinPut?
    
    func parseJSON(data: Data) -> HttpbinPut? {
        return data.al.jsonType(type: HttpbinPut.self)
    }
}

struct HttpbinPut: Codable {
    var origin: String
    var url: String
}

