//
//  NetworkManagerSpec.swift
//  NetworkLayerTests
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import Quick
import Nimble

@testable import NetworkLayer

class NetworkManagerSpec: QuickSpec {

    var session: NetworkSessionMock!
    var networkManager: NetworkManager!

    override func spec() {
        beforeEach {
            self.session = NetworkSessionMock()
            self.networkManager = NetworkManager(session: self.session)
        }

        describe("Network Manager request") {

            it("should return decoded model on success") {

                let expectedUser = UserMock.testInstance()
                var user: UserMock?

                self.session.data = try? expectedUser.encoded()
                self.networkManager.session = self.session

                self.networkManager.request(NetworkServiceMock.success) { (result: Result<UserMock, Error>) in
                    user = try? result.get()
                }
                expect(user).to(equal(expectedUser))
            }

            it("should be cancellable") {

                self.networkManager.request(NetworkServiceMock.success) { (_: Result<UserMock, Error>) in
                }
                expect(self.networkManager.task?.state).to(equal(.running))

                self.networkManager.cancel()
                expect(self.networkManager.task?.state).to(equal(.canceling))
            }

            context("when doing post (sending data and headers)") {

                let user = UserMock.testInstance()
                var networkManager = NetworkManager(session: NetworkSessionMock())

                networkManager.request(NetworkServiceMock.post(user)) { (_: Result<UserMock, Error>) in
                }
                let session = networkManager.session as? NetworkSessionMock

                it("should set request headers") {
                    expect(session?.request?.allHTTPHeaderFields)
                        .to(equal(NetworkServiceMock.post(user).headers))
                }

                it("should encode request body") {
                    expect(session?.request?.httpBody).to(equal(try? user.encoded()))
                }
            }
        }
    }
}
