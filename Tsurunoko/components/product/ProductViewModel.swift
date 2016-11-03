//
//  ProductViewModel.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Product {

    struct ViewModel {

        let title: String
        let detail: String
        let price: String
        let quantity: String
        let producerName: String
        let incrementEnabled: Bool
        let decrementEnabled: Bool
    }
}

extension Product.ViewModel {

    init() {
        title = ""
        detail = ""
        price = ""
        quantity = ""
        producerName = ""
        incrementEnabled = true
        decrementEnabled = false
    }
}

