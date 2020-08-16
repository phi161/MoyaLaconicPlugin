//
//  Laconic.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 1/7/20.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import Foundation
import Moya

public protocol Laconic {

    var primaryIdentifier: String { get }
    var secondaryIdentifier: String { get }

}

/**
 This extension takes care of Moya's support for single and multiple `TargetType`s (through the `MultiTarget` enum).
 In the first case, it will return `nil` if the target is not implementing the `Laconic` protocol.
 In the second case, it will try to find a `Laconic` target either in one of the wrapped targets or if the `MultiTarget` itself conforms to it.

 Thus, clients don't have to conform to `Laconic` for the plugin to work with `MultiTarget`s, as described in https://github.com/Moya/Moya/issues/1720
 */

extension TargetType {

    var laconic: Laconic? {
        if let multiTarget = self as? MultiTarget {
            if let laconicMultiTarget = multiTarget as? Laconic {
                return laconicMultiTarget
            } else {
                if let laconic = multiTarget.target as? Laconic {
                    return laconic
                } else {
                    return nil
                }
            }
        } else {
            if let laconic = self as? Laconic {
                return laconic
            } else {
                return nil
            }
        }
    }

}
