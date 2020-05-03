//
//  NetworkSessionDataTask.swift
//  NetworkLayer
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

public protocol NetworkSessionDataTask {
    var state: URLSessionDataTask.State { get }

    mutating func resume()
    mutating func cancel()
}

extension URLSessionDataTask: NetworkSessionDataTask {}
