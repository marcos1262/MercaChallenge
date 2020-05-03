//
//  Product.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 02/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

struct Product: Decodable {
    var name: String
    var onSale: Bool
    var regularPrice: String
    var actualPrice: String
    var imagePath: String
    var discountPercentage: String
    var installments: String
    var sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case name
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case imagePath = "image"
        case discountPercentage = "discount_percentage"
        case installments
        case sizes
    }
}
