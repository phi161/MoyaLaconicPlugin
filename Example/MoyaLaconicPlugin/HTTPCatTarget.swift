//
//  HTTPCatTarget.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 1/7/20.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import Foundation
import Moya

enum HTTPCatTarget {
    case catOk
    case catNotFound
}


extension HTTPCatTarget: TargetType {

    var baseURL: URL {
        return URL(string: "https://http.cat/")!
    }

    var path: String {
        switch self {
        case .catOk:
            return "200"
        case .catNotFound:
            return "404"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return Task.requestPlain
    }

    var headers: [String : String]? {
        return [:]
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

}
