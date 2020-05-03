//
//  Cell.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

protocol Cell: ViewCode { // should be a type restricting to table ou collection view cell
    associatedtype ViewModelType: ViewModel

    var viewModel: ViewModelType? { get set }
}
