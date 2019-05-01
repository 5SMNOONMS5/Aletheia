//
//  NetworkingClientPostTest.swift
//  AletheiaTests
//
//  Created by stephen on 2019/4/30.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import XCTest
import Alamofire
@testable import Aletheia

class NetworkingClientPostTest: XCTestCase, Networkable {
    
    var parameters: [String : Any]? = [:]
    
    var baseURL: String = "https://httpbin.org/get"
    
    var networkClient: NetworkClient = NetworkClient()
    
    func start(completion: @escaping Response) {
        let expectation = XCTestExpectation(description: "Test request with http post method from httpbin.org")
        networkClient.performRequest(self) { (response) in
            if let data = response.value as? Data,
                let object = self.parseJSON(data: data),
                response.isSuccess {
                XCTAssertNotNil(object.origin)
                XCTAssertNotNil(object.url)
                ALPrint(msg: object)
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

extension NetworkingClientPostTest: JSONDecodablePeorocol {
    
    typealias ResponseStruct = HttpbinPost?
    
    func parseJSON(data: Data) -> HttpbinPost? {
        return data.al.jsonType(type: HttpbinPost.self)
    }
}
/*
{
    "args": {},
    "data": "",
    "files": {},
    "form": {},
    "headers": {
        "Accept": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7,und;q=0.6,cy;q=0.5",
        "Content-Length": "0",
        "Host": "httpbin.org",
        "Origin": "https://httpbin.org",
        "Referer": "https://httpbin.org/",
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36"
    },
    "json": null,
    "origin": "118.163.104.55, 118.163.104.55",
    "url": "https://httpbin.org/post"
}
*/

/// cf. https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
struct HttpbinPost: Codable {
    
    var origin: String
    var url: String
    
    struct Container: Codable {
        var Accept: String
        var Host: String
//        var Accept_Encoding: String
    }
    
    var headers: Container
}
