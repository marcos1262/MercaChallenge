//
//  ProductCollectionViewCell.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell, Cell {

    lazy var mainBackground = UIView()

    lazy var shadowLayer = ShadowView()

    lazy var coverImageView = UIImageView()
        .set(\.contentMode, to: .scaleAspectFill)

    lazy var titleLabel = UILabel()
        .set(\.numberOfLines, to: 2)
        .set(\.textColor, to: .black)
        .set(\.font, to: UIFont.systemFont(ofSize: 24, weight: .bold))

    lazy var discountPercentageView = UIView()
        .set(\.backgroundColor, to: UIColor(red: 255/255, green: 230/255, blue: 230/255, alpha: 0.8))
        .set(\.layer.cornerRadius, to: 24)

    lazy var discountPercentageLabel = UILabel()
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 16))
        .set(\.textAlignment, to: .left)
        .set(\.textColor, to: .systemRed)

    var viewModel: ProductCellViewModel? {
        didSet {
            setup()
        }
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup() {
        setupSubviews()
        setupLayout()

        titleLabel.text = viewModel?.name
        discountPercentageLabel.text = viewModel?.discountPercentage
        viewModel?.updateImage = updateImage
        viewModel?.loadImage()

        updateImage()

        updateDiscountTag()

        mainBackground.layer.masksToBounds = true
        mainBackground.layer.cornerRadius = 8
        mainBackground.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
        mainBackground.layer.borderWidth = 0.5
    }

    func setupSubviews() {
        contentView.addSubview(shadowLayer)
        contentView.addSubview(mainBackground)

        mainBackground.addSubview(coverImageView)

        mainBackground.layer.addSublayer(Gradient.main(contentView.frame.size.width, 100,
                                                    isBottomUp: true,
                                                    elementHeight: contentView.frame.size.height,
                                                    color: .white))

        mainBackground.addSubview(titleLabel)

        mainBackground.addSubview(discountPercentageView)
        discountPercentageView.addSubview(discountPercentageLabel)
    }

    func setupLayout() {
        shadowLayer.fillToSuperview()
        mainBackground.fillToSuperview()

        coverImageView.fillToSuperview()

        titleLabel
            .anchor(leading: mainBackground.leadingAnchor, padding: 16)
            .anchor(trailing: mainBackground.trailingAnchor, padding: 16)
            .anchor(bottom: mainBackground.bottomAnchor, padding: 16)

        discountPercentageView
            .anchor(top: coverImageView.topAnchor, padding: 16)
            .anchor(trailing: mainBackground.trailingAnchor, padding: 16)
            .anchor(widthConstant: 48)
            .anchor(aspectRatio: 1)

        discountPercentageLabel
            .anchor(centerX: discountPercentageView.centerXAnchor)
            .anchor(centerY: discountPercentageView.centerYAnchor)
    }

    func updateImage() {
        coverImageView.image = viewModel?.image
    }

    func updateDiscountTag() {
        discountPercentageView.isHidden = (discountPercentageLabel.text == "")
    }
}
