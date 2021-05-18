//
//  ViewController.swift
//  Alamofire5RequestRetrierDemo
//
//  Created by Kazunori Aoki on 2021/05/18.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        requestData()
        
        fetchMyCotes()
    }

    private func requestData() {
        AF.request(TodoRequest(), method: .get, interceptor: CustomInterceptor()).responseJSON { (response: AFDataResponse<Any>) in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchMyCotes() {
        // .validate()は、statusCodeの範囲内を判定し、falseの場合、retryに入る
        AF.request(CatsRequest.votes, interceptor: CustomInterceptor()).validate(statusCode: 200...300).responseJSON { (response: AFDataResponse<Any>) in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

