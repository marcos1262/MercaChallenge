//
//  BuilderChain.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

protocol BuilderChain where Self: AnyObject {}

extension BuilderChain {
    @discardableResult
    func set<T>(_ property: ReferenceWritableKeyPath<Self, T>, to value: T) -> Self {
        self[keyPath: property] = value
        return self
    }

    @discardableResult
    func run(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
