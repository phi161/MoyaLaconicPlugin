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

}

extension LaconicPlugin: PluginType {

    public func willSend(_ request: RequestType, target: TargetType) {
        print("\(pluginIdentifier)\(requestIdentifier)")
    }

    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            print("\(pluginIdentifier)\(responseIdentifier)\(successIdentifier) \(response.statusCode)")
        case .failure(let error):
            print("\(pluginIdentifier)\(responseIdentifier)\(failureIdentifier) \(error.localizedDescription)")
        }
    }

}
