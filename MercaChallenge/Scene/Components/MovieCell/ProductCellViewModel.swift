//
//  ProductCellViewModel.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class ProductCellViewModel: ViewModel {
    enum State { case show, error(Error) }
    var state: State = .show {
        didSet {
            // TODO: send cell error to view
        }
    }

    var model: Product

    init(product: Product) {
        model = product
    }

    // MARK: View content

    var name: String {
        model.name.capitalized
    }
    var discountPercentage: String {
        (model.discountPercentage != "" ? "-" : "") + model.discountPercentage
    }
    var image: UIImage = .placeholder {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateImage?()
            }
        }
    }

    // MARK: View updates

    var updateImage: VoidClosure?

    // MARK: User actions

    func loadImage() {
        ImageLoader.loadImageUsingCache(from: URL(string: model.imagePath)) { [weak self] image in
            self?.image = image
        }
    }
}
