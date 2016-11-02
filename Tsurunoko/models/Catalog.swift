//
//  Catalog.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

protocol Catalog {

    var market: Model.Market { get }
    var productGroups: [Model.ProductGroup] { get }
    var products: [Model.Product] { get }
    var producers: [Model.Producer] { get }
}

extension Model {

    struct CatalogImpl: Catalog {

        let market: Market
        let productGroups: [ProductGroup]
        let products: [Product]
        let producers: [Producer]
    }

    struct Market {

        typealias ID = String

        let identifier: ID
        let productGroupIDs: [ProductGroup.ID]
    }

    struct ProductGroup {

        typealias ID = String

        let identifier: ID
        let name: String
        let productIDs: [Product.ID]
    }

    struct Product {

        typealias ID = String

        let identifier: ID
        let name: String
        let producerID: Producer.ID
        let description: String
        let price: Double
    }

    struct Producer {
        
        typealias ID = String
        
        let identifier: ID
        let name: String
        let description: String
    }
}

struct DemoCatalog: Catalog {

    // MARK: - Market

    var market: Model.Market {
        return Model.Market(identifier: "GreatCheese", productGroupIDs: productGroups.map({ $0.identifier }))
    }

    // MARK: - Product Groups

    var productGroups: [Model.ProductGroup] {
        return [cheese, meat]
    }

    var cheese: Model.ProductGroup {
        return Model.ProductGroup(identifier: "cheese", name: "Cheese", productIDs: cheeses.map { $0.identifier })
    }

    var meat: Model.ProductGroup {
        return Model.ProductGroup(identifier: "meat", name: "Meat", productIDs: meats.map { $0.identifier })
    }

    // MARK: - Products

    var products: [Model.Product] {
        return cheeses + meats
    }

    var cheeses: [Model.Product] {
        let cheese1 = Model.Product(identifier: "cheese1", name: "Small Cheese", producerID: cheeser.identifier, description: "A cheese.", price: 1.0)
        let cheese2 = Model.Product(identifier: "cheese2", name: "Medium Cheese", producerID: cheeser.identifier, description: "A cheese.", price: 2.0)
        let cheese3 = Model.Product(identifier: "cheese3", name: "Large Cheese", producerID: cheeser.identifier, description: "A cheese.", price: 3.0)
        let cheese4 = Model.Product(identifier: "cheese4", name: "Goat Cheese", producerID: cheesey.identifier, description: "A pungent cheese.", price: 4.0)
        let cheese5 = Model.Product(identifier: "cheese5", name: "Sheep Cheese", producerID: cheesey.identifier, description: "An expensive cheese.", price: 5.0)

        return [cheese1, cheese2, cheese3, cheese4, cheese5]
    }

    var meats: [Model.Product] {
        let meat1 = Model.Product(identifier: "meat1", name: "Small Meat", producerID: meater.identifier, description: "A meat.", price: 1.0)
        let meat2 = Model.Product(identifier: "meat2", name: "Medium Meat", producerID: meater.identifier, description: "A meat.", price: 2.0)
        let meat3 = Model.Product(identifier: "meat3", name: "Large Meat", producerID: meater.identifier, description: "A meat.", price: 3.0)
        let meat4 = Model.Product(identifier: "meat4", name: "Goat Fish", producerID: fishey.identifier, description: "A pungent meat.", price: 4.0)
        let meat5 = Model.Product(identifier: "meat5", name: "Sheep Fish", producerID: fishey.identifier, description: "An expensive meat.", price: 5.0)

        return [meat1, meat2, meat3, meat4, meat5]
    }

    // MARK: - Producers

    var producers: [Model.Producer] {
        return [cheeser, cheesey, meater, fishey]
    }

    var cheeser: Model.Producer {
        return Model.Producer(identifier: "Cheeser", name: "Cheeser", description: "Differently sized cheeses.")
    }

    var cheesey: Model.Producer {
        return Model.Producer(identifier: "Cheesey", name: "Cheesey", description: "Differently sourced cheeses.")
    }

    var meater: Model.Producer {
        return Model.Producer(identifier: "Meater", name: "Meater", description: "Differently sized meats.")
    }

    var fishey: Model.Producer {
        return Model.Producer(identifier: "Fishey", name: "Fishey", description: "Differently sourced fishes.")
    }
}

