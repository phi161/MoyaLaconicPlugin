//
//  LaconicPlugin.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 05/19/2020.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import Moya

public struct LaconicPlugin {

    public var pluginIdentifier: String
    public var requestIdentifier: String
    public var responseIdentifier: String
    public var successIdentifier: String
    public var failureIdentifier: String

    public init(pluginIdentifier: String = "💭",
                requestIdentifier: String = "🔜",
                responseIdentifier: String = "🔙",
                successIdentifier: String = "✅",
                failureIdentifier: String = "❌") {
        self.pluginIdentifier = pluginIdentifier
        self.requestIdentifier = requestIdentifier
        self.responseIdentifier = responseIdentifier
        self.successIdentifier = successIdentifier
        self.failureIdentifier = failureIdentifier
    }

    func requestDescription(request: RequestType) -> String {
        return "\(pluginIdentifier)\(requestIdentifier)"
    }

    func responseDescription(result: Result<Response, MoyaError>) -> String {
        switch result {
        case .success(let response):
            return "\(pluginIdentifier)\(responseIdentifier)\(successIdentifier) \(response.statusCode)"
        case .failure(let error):
            return "\(pluginIdentifier)\(responseIdentifier)\(failureIdentifier) \(error.localizedDescription)"
        }
    }

}

extension LaconicPlugin: PluginType {

    public func willSend(_ request: RequestType, target: TargetType) {
        print(requestDescription(request: request))
    }

    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print(responseDescription(result: result))
    }

}
