//
//  LastfmTarget.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 05/19/2020.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import Foundation
import Moya

enum LastfmTarget {
    case topTracks(user: String, limit: Int)
    case friends(user: String, limit: Int)

    private func stubbedResponse(_ filename: String) -> Data {
        let path = Bundle.main.path(forResource: filename, ofType: "json")
        return (try! Data(contentsOf: URL(fileURLWithPath: path!)))
    }

}

extension LastfmTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://ws.audioscrobbler.com")!
    }
    
    var path: String {
        return "2.0"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        var parameters = [
            "format": "json"
        ]
        switch self {
        case let .topTracks(user, limit):
            parameters["method"] = "user.gettoptracks"
            parameters["user"] = user
            parameters["limit"] = String(limit)
        case let .friends(user, limit):
            parameters["method"] = "user.getfriends"
            parameters["user"] = user
            parameters["limit"] = String(limit)
        }
        return Task.requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        switch self {
        case .topTracks:
            return stubbedResponse("topTracks")
        case .friends:
            return stubbedResponse("friends")
        }
    }
    
}
