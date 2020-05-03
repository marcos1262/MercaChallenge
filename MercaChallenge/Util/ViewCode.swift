//
//  File.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

protocol ViewCode where Self: UIView {
    init(frame: CGRect)

    func setup()
    func setupSubviews()
    func setupLayout()
}

extension ViewCode {
    func setup() {
        setupSubviews()
        setupLayout()
    }
}
