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

        var items: [CartItem]
    }

    struct CartItem {

        let productID: Product.ID
        var quantity: Int
    }
}

extension Model.Cart {

    init() {
        
        items = []
    }
}

