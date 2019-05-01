//
//  NetworkingClientTest.swift
//  AletheiaTests
//
//  Created by stephen Uon 2019/4/15.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import XCTest
import Alamofire
@testable import Aletheia

class NetworkingClientTest: XCTestCase, Networkable {
    
    var parameters: [String : Any]? = [:]
    
    var method: HTTPMethod = HTTPMethod.post
    
    var baseURL: String = "https://httpbin.org/get"
    
    var networkClient: NetworkClient = NetworkClient()
    
    func start(completion: @escaping Response) {
        let expectation = XCTestExpectation(description: "Test request with http get method from httpbin.org")
        networkClient.performRequest(self) { (response) in
            if let data = response.value as? Data,
                let object = self.parseJSON(data: data),
                response.isSuccess {
                XCTAssertNotNil(object.origin)
                XCTAssertNotNil(object.url)
            } else {
                fatalError("Parse error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRequest() {
        self.start { (any) in
            print(any.description)
        }
    }
}

extension NetworkingClientTest: JSONDecodablePeorocol {
    
    typealias ResponseStruct = Httpbin?
    
    func parseJSON(data: Data) -> Httpbin? {
        return data.al.jsonType(type: Httpbin.self)
    }
}

struct Httpbin: Codable {
    var origin: String
    var url: String
}
