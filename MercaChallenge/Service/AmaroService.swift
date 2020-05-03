//
//  AmaroService.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import NetworkLayer

enum AmaroService {
    case products
}

extension AmaroService: NetworkService {
    var baseURL: URL { URL(string: "http://www.mocky.io/v2")! }

    var path: String {
        switch self {
        case .products: return "/59b6a65a0f0000e90471257d"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .products: return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .products: return .requestPlain
        }
    }

    var headers: Headers? {
        ["Content-Type": "application/json;charset=utf-8"]
    }
}
