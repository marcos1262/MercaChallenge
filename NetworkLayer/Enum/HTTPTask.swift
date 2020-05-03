//
//  HTTPTask.swift
//  NetworkLayer
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

public enum HTTPTask {
    case requestPlain
    case requestBodyParameters(Encodable)
    case requestURLParameters([String: CustomStringConvertible])
}
