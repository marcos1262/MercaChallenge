//
//  ProductsViewController.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    let productsView = ProductsView()

    let collectionViewDataSource = CollectionViewDataSource<ProductCollectionViewCell>(viewModels: [])

    var viewModel: ProductsViewModel!

    init(viewModel: ProductsViewModel = ProductsViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        view = productsView
        title = "Amaro Store"

        productsView.collectionView.register(ProductCollectionViewCell.self)
        productsView.collectionView.dataSource = collectionViewDataSource
        productsView.collectionView.delegate = self

        viewModel.setLoadingLayout = productsView.setLoadingLayout
        viewModel.setEmptyLayout = productsView.setEmptyLayout
        viewModel.setShowLayout = productsView.setShowLayout
        viewModel.updateData = updateData
        viewModel.showError = showError
        viewModel.showProductDetail = showProductDetail

        viewModel.loadProducts()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func calculateIndexPathsToReload(from newViewModels: [ProductCellViewModel]) -> [IndexPath] {
        let startIndex = collectionViewDataSource.viewModels.count
        let endIndex = startIndex + newViewModels.count
        return (startIndex..<endIndex).map { IndexPath(item: $0, section: 0) }
    }

    func updateData(newViewModels: [ProductCellViewModel]) {
        let indexPaths = calculateIndexPathsToReload(from: newViewModels)
        collectionViewDataSource.viewModels.append(contentsOf: newViewModels)
        productsView.collectionView.insertItems(at: indexPaths)
    }

    func showError(error: Error) {
        showError(message: error.localizedDescription) { [weak self] in
            self?.viewModel.loadProducts()
        }
    }

    func showProductDetail(product: Product) {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailViewController = ProductDetailViewController(viewModel: productDetailViewModel)

        self.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectProduct(index: indexPath.item)
    }
}
