//
//  TodoRequest.swift
//  Alamofire5RequestRetrierDemo
//
//  Created by Kazunori Aoki on 2021/05/18.
//

import Foundation
import Alamofire

struct TodoRequest: URLConvertible {
    func asURL() throws -> URL {
        return URL(string: "https://jsonplaceholder.typicode.com/todos/1000")!
    }
}
