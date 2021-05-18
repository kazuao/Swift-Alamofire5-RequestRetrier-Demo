//
//  CustomInterceptor.swift
//  Alamofire5RequestRetrierDemo
//
//  Created by Kazunori Aoki on 2021/05/18.
//

import Foundation
import Alamofire

class CustomInterceptor: RequestInterceptor {
    
    private let retryLimit = 3
    private var xAPIToken = "d502bb62-26b9-4531-9fee-509c7ee509c7ee3d62f"
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        //        completion(.retry)                          // リトライを続ける
        //        completion(.retryWithDelay(1))              // timeIntervalのあとに続ける
        //        completion(.doNotRetry)                     // リトライしない
        //        completion(.doNotRetryWithError(let error)) // リトライしないでエラーを投げる

        // 特定のAPIで動作させられる
        // ステータスコードで分岐
        if let url = request.request?.url?.absoluteString,
           url.contains("/v1/votes"),
           request.retryCount < retryLimit,
           request.response?.statusCode == 401 {
            
            
            completion(.retry)
            
        } else {
            completion(.doNotRetry)
        }
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        
        if let urlString = urlRequest.url?.absoluteString, urlString.contains("/v1/votes") {
            // valueを足せる
            urlRequest.addValue(xAPIToken, forHTTPHeaderField: "x-api-key")
        }
        
        completion(.success(urlRequest))
    }
}
