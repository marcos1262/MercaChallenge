//
//  ProductDetailView.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class ProductDetailView: UIView, ViewCode {

    lazy var loadingView = LoadingView()

    lazy var scrollView = UIScrollView()
        .set(\.contentInsetAdjustmentBehavior, to: .never)
        .set(\.delegate, to: self)

    lazy var contentView = UIView()

    lazy var coverImageView = UIImageView()
        .set(\.contentMode, to: .scaleAspectFill)
        .set(\.clipsToBounds, to: true)

    lazy var nameLabel = UILabel()
        .set(\.numberOfLines, to: 0)
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 24))
        .run { label in
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    lazy var actualPriceLabel = UILabel()
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 24))
        .set(\.textAlignment, to: .right)
        .set(\.textColor, to: .systemGreen)

    lazy var discountPercentageView = UIView()
        .set(\.backgroundColor, to: UIColor.white.withAlphaComponent(0.8))
        .set(\.layer.cornerRadius, to: 8)
        .set(\.layer.maskedCorners, to: [.layerMinXMinYCorner])

    lazy var discountPercentageLabel = UILabel()
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 24))
        .set(\.textAlignment, to: .left)
        .set(\.textColor, to: .systemRed)

    lazy var regularPriceLabel = UILabel()
        .set(\.textAlignment, to: .right)
        .set(\.textColor, to: .gray)

    lazy var outOfStockLabel = UILabel()
        .set(\.textColor, to: .gray)

    lazy var sizesTitleLabel = UILabel()
        .set(\.text, to: "SIZES")
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 16))
        .run { label in
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    lazy var installmentsTitleLabel = UILabel()
        .set(\.text, to: "INSTALLMENT")
        .set(\.font, to: UIFont.boldSystemFont(ofSize: 16))

    lazy var sizesLabel = UILabel()
        .set(\.numberOfLines, to: 0)
        .set(\.textColor, to: .gray)
        .run { label in
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    lazy var installmentsLabel = UILabel()
        .set(\.textAlignment, to: .right)
        .set(\.textColor, to: .gray)

    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        setupSubviews()
        setupLayout()

        self.backgroundColor = .white

        if #available(iOS 13, *) {
            self.backgroundColor = .systemBackground
            regularPriceLabel.textColor = .secondaryLabel
            installmentsLabel.textColor = .secondaryLabel
            sizesLabel.textColor = .secondaryLabel
        }
    }

    func setupSubviews() {
        addSubview(loadingView)
        addSubview(scrollView)

        scrollView.addSubview(contentView)

        contentView.addSubview(coverImageView)

        contentView.addSubview(discountPercentageView)
        discountPercentageView.addSubview(discountPercentageLabel)

        contentView.addSubview(nameLabel)
        contentView.addSubview(outOfStockLabel)
        contentView.addSubview(sizesTitleLabel)
        contentView.addSubview(sizesLabel)

        contentView.addSubview(actualPriceLabel)
        contentView.addSubview(regularPriceLabel)
        contentView.addSubview(installmentsTitleLabel)
        contentView.addSubview(installmentsLabel)
    }

    func setupLayout() {
        loadingView.fillToSuperview()

        scrollView
            .anchor(top: safeAreaLayoutGuide.topAnchor, padding: -52)
            .anchor(leading: safeAreaLayoutGuide.leadingAnchor)
            .anchor(trailing: safeAreaLayoutGuide.trailingAnchor)
            .anchor(bottom: safeAreaLayoutGuide.bottomAnchor)

        contentView
            .anchor(width: widthAnchor)
            .fillToSuperview(safeArea: false)

        coverImageView
            .anchor(top: contentView.topAnchor)
            .anchor(centerX: contentView.centerXAnchor)
            .anchor(width: contentView.widthAnchor)
            .anchor(aspectRatio: 0.75)

        discountPercentageView
            .anchor(bottom: coverImageView.bottomAnchor)
            .anchor(trailing: contentView.trailingAnchor)

        discountPercentageLabel
            .anchor(top: discountPercentageView.topAnchor, padding: 16)
            .anchor(leading: discountPercentageView.leadingAnchor, padding: 16)
            .anchor(trailing: discountPercentageView.trailingAnchor, padding: 16)
            .anchor(bottom: discountPercentageView.bottomAnchor, padding: 16)

        nameLabel
            .anchor(top: coverImageView.bottomAnchor, padding: 16)
            .anchor(leading: contentView.leadingAnchor, padding: 16)

        actualPriceLabel
            .anchor(top: coverImageView.bottomAnchor, padding: 16)
            .anchor(leading: nameLabel.trailingAnchor, padding: 16)
            .anchor(trailing: contentView.trailingAnchor, padding: 16)

        regularPriceLabel
            .anchor(top: actualPriceLabel.bottomAnchor, padding: 8)
            .anchor(leading: nameLabel.trailingAnchor, padding: 16)
            .anchor(trailing: contentView.trailingAnchor, padding: 16)

        installmentsTitleLabel
            .anchor(top: regularPriceLabel.bottomAnchor, padding: 16)
            .anchor(leading: sizesTitleLabel.trailingAnchor, padding: 16)
            .anchor(trailing: contentView.trailingAnchor, padding: 16)

        installmentsLabel
            .anchor(top: installmentsTitleLabel.bottomAnchor, padding: 8)
            .anchor(leading: sizesLabel.trailingAnchor, padding: 16)
            .anchor(trailing: contentView.trailingAnchor, padding: 16)

        outOfStockLabel
            .anchor(top: nameLabel.bottomAnchor, padding: 16)
            .anchor(leading: contentView.leadingAnchor, padding: 16)

        sizesTitleLabel
            .anchor(top: outOfStockLabel.bottomAnchor, padding: 16)
            .anchor(leading: contentView.leadingAnchor, padding: 16)

        sizesLabel
            .anchor(top: sizesTitleLabel.bottomAnchor, padding: 8)
            .anchor(leading: contentView.leadingAnchor, padding: 16)
            .anchor(bottom: contentView.bottomAnchor, padding: 16)
    }

    func setLoadingLayout() {
        loadingView.isHidden = false
        loadingView.start()

        contentView.isHidden = true
    }

    func updatePriceText() {
        let attributeString =  NSMutableAttributedString(string: regularPriceLabel.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2,
                                     range: NSMakeRange(0, attributeString.length))
        regularPriceLabel.attributedText = attributeString
    }
}

extension ProductDetailView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset

        if offset.y < 0.0 {
            let scaleFactor = 1 + (-1 * offset.y / (coverImageView.frame.height / 2))
            var transform = CATransform3DTranslate(CATransform3DIdentity, 0, offset.y, 0)
            transform = CATransform3DScale(transform, scaleFactor, scaleFactor, 1)
            coverImageView.layer.transform = transform
        } else {
            coverImageView.layer.transform = CATransform3DIdentity
        }
    }
}
