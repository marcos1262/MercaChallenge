//
//  ProductDetailViewController.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    let productDetailView = ProductDetailView()

    var viewModel: ProductDetailViewModel!

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        view = productDetailView
        title = ""

        viewModel.setLoadingLayout = productDetailView.setLoadingLayout
        viewModel.setShowLayout = setShowLayout
        viewModel.updateImage = updateImage

        viewModel.loadImage()
    }

    func setShowLayout() {
        productDetailView.nameLabel.text = viewModel?.name
        productDetailView.outOfStockLabel.text = viewModel?.outOfStock
        productDetailView.sizesLabel.text = viewModel?.sizes
        productDetailView.actualPriceLabel.text = viewModel?.actualPrice
        productDetailView.regularPriceLabel.text = viewModel?.regularPrice
        productDetailView.installmentsLabel.text = viewModel?.installments
        productDetailView.discountPercentageLabel.text = viewModel?.discountPercentage

        updateImage()

        productDetailView.loadingView.isHidden = true
        productDetailView.loadingView.stop()

        productDetailView.contentView.isHidden = false

        productDetailView.updatePriceText()
    }

    func updateImage() {
        productDetailView.coverImageView.image = viewModel?.image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
