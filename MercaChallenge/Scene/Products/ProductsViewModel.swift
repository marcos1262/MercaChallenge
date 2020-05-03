//
//  ProductsViewModel.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import NetworkLayer

class ProductsViewModel: ViewModel {
    enum State {
        case loading, empty, show, error(Error)
    }

    var state: State = .empty {
        didSet {
            DispatchQueue.main.async { [weak self] in
                switch self?.state {
                case .empty: self?.setEmptyLayout?()
                case .loading: self?.setLoadingLayout?()
                case .show: self?.setShowLayout?()
                case .error(let error): self?.showError?(error)
                default: break
                }
            }
        }
    }

    var model = [ProductCellViewModel]() {
        didSet {
            // Update view only with the new data
            let newViewModels: [ProductCellViewModel] = model.suffix(model.count - oldValue.count)
            DispatchQueue.main.async { [weak self] in
                self?.updateData?(newViewModels)
            }
        }
    }

    var networkManager: AnyNetworkManager

    init(networkManager: AnyNetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    // MARK: Coordinator actions

    var showProductDetail: ProductClosure?

    // MARK: View updates

    var setLoadingLayout: VoidClosure?
    var setEmptyLayout: VoidClosure?
    var setShowLayout: VoidClosure?
    var showError: ErrorClosure?

    var updateData: ProductCellViewModelClosure?

    // MARK: User actions

    func didSelectProduct(index: Int) {
        showProductDetail?(model[index].model)
    }

    func loadProducts() {
        networkManager.cancel()

        networkManager.request(AmaroService.products) { [weak self] (result: Result<ProductsResponse, Error>) in
            switch result {
            case .success(let response):
                self?.model.append(contentsOf: response.products
                    .filter({ $0.imagePath != "" })
                    .map({ ProductCellViewModel(product: $0) }))
                self?.state = .show
            case .failure(let error):
                self?.state = .error(error)
            }
        }
    }
}
