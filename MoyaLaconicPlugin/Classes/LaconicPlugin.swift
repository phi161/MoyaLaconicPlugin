//
//  LaconicPlugin.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 05/19/2020.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import Moya

public class LaconicPlugin {

    public init() {}

}

extension LaconicPlugin: PluginType {

    public func willSend(_ request: RequestType, target: TargetType) {
        print("will send: \(target.path)")
    }

}
