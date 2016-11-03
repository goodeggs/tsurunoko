//
//  Cart.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Model {

    struct Cart {

        let items: [CartItem]
    }

    struct CartItem {

        let productID: Product.ID
        let quantity: Int
    }
}

extension Model.Cart {

    init() {
        
        items = []
    }
}

