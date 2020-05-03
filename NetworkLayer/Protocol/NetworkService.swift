//
//  NetworkService.swift
//  NetworkLayer
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import Foundation

public typealias Headers = [String: String]

public protocol NetworkService {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: Headers? { get }
}
