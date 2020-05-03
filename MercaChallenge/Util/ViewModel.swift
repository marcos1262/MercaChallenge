//
//  ViewModel.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype ViewState
    associatedtype ModelType

    var state: ViewState { get }
    var model: ModelType { get }
}
