//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import Alamofire
import Foundation

public typealias Response = (Result<Data?>) -> Void

public protocol NetworkClientProtocol {
    
    func performRequest<Request: NetworkRequestProtocol>
        (_ request: Request,
         callback: @escaping Response)
}

public struct NetworkClient: NetworkClientProtocol {

    var sessionManager: SessionManager?
    
    /// cf. https://github.com/Alamofire/Alamofire/issues/157
    ///
    /// - Parameter timeoutInterval: default is 60 seconds
    public init(timeoutInterval: TimeInterval = 1) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = 10
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.sessionManager = SessionManager(configuration: configuration)
    }
    
    /// 對网络請求
    ///
    /// - Parameters:
    ///   - request: 傳入一個必須遵守 NetworkRequestProtocol 的值
    ///   - callback: 回傳 Data 以及 网络狀態
    public func performRequest<Request: NetworkRequestProtocol>(_ request: Request, callback: @escaping Response) {
    
        let requestURL = request.baseURL
        
        if request.printable { ALPrint(msg: "開始對 \(requestURL) 進行請求") }
                
        Alamofire.request(requestURL,
                                     method: request.method,
                                     parameters: request.parameters,
                                     encoding: URLEncoding.default,
                                     headers: request.header)
            .validate()
            .responseJSON(completionHandler: { (response) in
                
            switch (response.result) {
            case .success:
                
                if request.printable { ALPrint(msg: "請求 \(requestURL) 的回傳狀態：\(response.result.description)") }
                callback(Result.success(response.data))
                
            case .failure(let error):
                
                if request.printable {
                    ALPrint(msg: "請求 \(requestURL) 的回傳狀態：\(response.result.description) 原因是 \(error.localizedDescription)。", type: .negative)
                }
                
                callback(Result.failure(error))
            }
        })
    }
    
    public func cancelRequest() {
        
    }
}
