//
//  UserMock.swift
//  NetworkLayerTests
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

struct UserMock: Codable, Equatable {
    let uuid: Int
    let name: String

    static func testInstance() -> UserMock {
        return UserMock(uuid: Int(TestConstants.userUUIDExample.rawValue)!,
                        name: TestConstants.userNameExample.rawValue)
    }
}
