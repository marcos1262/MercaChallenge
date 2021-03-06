//
//  AnyNetworkManager.swift
//  NetworkLayer
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

public protocol AnyNetworkManager {
    mutating func request<ServiceType: NetworkService, ResponseType: Decodable>(
        _ endpoint: ServiceType,
        _ completion: @escaping (Result<ResponseType, Error>) -> Void)

    /// Cancel the current task
    mutating func cancel()
}
