//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit
import Alamofire

public protocol NetworkRequestProtocol {
    
    var endpoint: String { get }
    
    var baseURL: String { get set }
    
    var encoding: ParameterEncoding { get }
    
    var method: HTTPMethod { get }
    
    var parameters: [String : Any]? { get }
    
    var header: [String : String] { get }
    
    var networkClient: NetworkClient { get set }
    
    /// print network process, default is false
    var printable: Bool { get }
}

public extension NetworkRequestProtocol {
        
    var url: String { return baseURL + endpoint }
    
    var baseURL: String { return "" }
    
    var endpoint: String { return "" }
    
    var encoding: ParameterEncoding { return JSONEncoding.default }
    
    var method: HTTPMethod { return .get }
    
    var parameters: [String : Any] { return [:] }
    
    var header: [String : String] { return [:] }
    
    var printable: Bool { return false }
}

public protocol Networkable: NetworkRequestProtocol {
    func start(completion: @escaping Response)
}

