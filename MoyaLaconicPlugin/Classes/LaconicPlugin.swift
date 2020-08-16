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

    func requestDescription(request: RequestType, laconic: Laconic?) -> String {
        if let laconic = laconic {
            return "\(pluginIdentifier)\(laconic.primaryIdentifier)\(requestIdentifier)\(laconic.secondaryIdentifier)"
        } else {
            return "\(pluginIdentifier)\(requestIdentifier)"
        }
    }

    func responseDescription(result: Result<Response, MoyaError>, laconic: Laconic?) -> String {
        if let laconic = laconic {
            switch result {
            case .success(let response):
                return "\(pluginIdentifier)\(laconic.primaryIdentifier)\(responseIdentifier)\(successIdentifier)\(laconic.secondaryIdentifier) (HTTP \(response.statusCode))"
            case .failure(let error):
                return "\(pluginIdentifier)\(laconic.primaryIdentifier)\(responseIdentifier)\(failureIdentifier)\(laconic.secondaryIdentifier) \(error.localizedDescription)"
            }
        } else {
            switch result {
            case .success(let response):
                return "\(pluginIdentifier)\(responseIdentifier)\(successIdentifier) (HTTP \(response.statusCode))"
            case .failure(let error):
                return "\(pluginIdentifier)\(responseIdentifier)\(failureIdentifier) \(error.localizedDescription)"
            }
        }
    }

}

extension LaconicPlugin: PluginType {

    public func willSend(_ request: RequestType, target: TargetType) {
        print(requestDescription(request: request, laconic: target.laconic))
    }

    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print(responseDescription(result: result, laconic: target.laconic))
    }

}
