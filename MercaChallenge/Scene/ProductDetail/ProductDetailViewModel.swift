//
//  ProductDetailViewModel.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import NetworkLayer
import UIKit

class ProductDetailViewModel: ViewModel {
    enum State {
        case loading, show, error(Error)
    }

    var state: State = .loading {
        didSet {
            DispatchQueue.main.async { [weak self] in
                switch self?.state {
                case .loading: self?.setLoadingLayout?()
                case .show: self?.setShowLayout?()
                case .error(let error): self?.showError?(error)
                default: break
                }
            }
        }
    }

    var model: Product

    var networkManager: AnyNetworkManager!

    init(product: Product, networkManager: AnyNetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        model = product
    }

    // MARK: View content

    var name: String {
        model.name.capitalized
    }
    var actualPrice: String {
        model.actualPrice
    }
    var regularPrice: String {
        model.regularPrice != model.actualPrice ? model.regularPrice : ""
    }
    var discountPercentage: String {
        (model.discountPercentage != "" ? "-" : "") + model.discountPercentage
    }
    var installments: String {
        model.installments
    }
    var outOfStock: String {
        model.onSale ? "" : "Out of Stock"
    }
    var sizes: String {
        var sizes = model.sizes.filter({ $0.available }).map({ $0.size }).joined(separator: ", ")
        if sizes == "U" {
            sizes = "Unique"
        }
        return sizes
    }
    var image: UIImage = .placeholder {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateImage?()
            }
        }
    }

    // MARK: View updates

    var setLoadingLayout: VoidClosure?
    var setShowLayout: VoidClosure?
    var showError: ErrorClosure?

    var updateImage: VoidClosure?

    // MARK: User actions

    func loadImage() {
        ImageLoader.loadImageUsingCache(from: URL(string: model.imagePath)) { [weak self] image in
            self?.image = image
            self?.state = .show
        }
    }
}
