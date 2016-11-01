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

        typealias ID = String

        let id: ID
        let productIDs: [Product.ID]
    }
}
