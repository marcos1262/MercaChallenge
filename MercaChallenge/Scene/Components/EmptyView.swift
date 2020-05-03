//
//  EmptyView.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class EmptyView: UIView, ViewCode {

    lazy var descriptionLabel = UILabel()
        .set(\.textColor, to: .gray)
        .set(\.numberOfLines, to: 0)
        .set(\.font, to: .systemFont(ofSize: 20))

    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        if #available(iOS 13, *) {
            descriptionLabel.textColor = .secondaryLabel
        }

        setupSubviews()
        setupLayout()
    }

    func setupSubviews() {
        addSubview(descriptionLabel)
    }

    func setupLayout() {
        descriptionLabel
            .anchor(centerX: centerXAnchor)
            .anchor(centerY: centerYAnchor)
    }
}
