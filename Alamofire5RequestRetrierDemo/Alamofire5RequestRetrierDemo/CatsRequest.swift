//
//  CatsRequest.swift
//  Alamofire5RequestRetrierDemo
//
//  Created by Kazunori Aoki on 2021/05/18.
//

import Foundation
import Alamofire

enum CatsRequest: URLRequestConvertible {
    
    static let baseURLString = "https://api.thecatapi.com/v1"
    
    case votes
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .votes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .votes:
            return "/votes"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try CatsRequest.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
