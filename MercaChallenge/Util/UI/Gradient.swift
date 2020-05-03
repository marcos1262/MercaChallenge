//
//  Gradient.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

struct Gradient {
    static func main(_ width: CGFloat, _ height: CGFloat,
                     isBottomUp: Bool = false, elementHeight: CGFloat = 0,
                     color: UIColor = .black) -> CAGradientLayer {
        let gradient = CAGradientLayer()

        if isBottomUp {
            gradient.frame = CGRect(x: 0, y: elementHeight-height, width: width, height: height)
            gradient.startPoint = CGPoint(x: 1, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
            gradient.startPoint = CGPoint(x: 1, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
        }

        gradient.colors = [
            color.withAlphaComponent(0.9).cgColor,
            color.withAlphaComponent(0.8).cgColor,
            color.withAlphaComponent(0.2).cgColor,
            color.withAlphaComponent(0.01).cgColor
//            UIColor.clear.cgColor
        ]

        return gradient
    }
}
