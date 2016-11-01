//
//  Market.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Model {

    struct Market {

        let id: String
        let productGroupIDs: [ProductGroup.ID]
    }

    struct ProductGroup {

        typealias ID = String

        let id: ID
        let name: String
        let imageURL: NSURL
        let productIDs: [Product.ID]
    }

    struct Product {

        typealias ID = String

        let id: ID
        let name: String
        let producerID: Producer.ID
        let description: String
        let price: Double
    }

    struct Producer {
        
        typealias ID = String
        
        let id: ID
        let name: String
        let description: String
    }
}
