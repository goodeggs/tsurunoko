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

        let identifier: String
        let productGroupIDs: [ProductGroup.ID]

        static func demo() -> Market {
            let productGroups = [
                ProductGroup.demoCheese(),
                ProductGroup.demoMeat()
            ]
            return Market(identifier: "GreatCheese", productGroupIDs: productGroups.map({ $0.identifier }))
        }
    }

    struct ProductGroup {

        typealias ID = String

        let identifier: ID
        let name: String
        let productIDs: [Product.ID]

        static func demoCheese() -> ProductGroup {
            return ProductGroup(identifier: "cheese", name: "Cheese", productIDs: Product.demoCheeses().map { $0.identifier })
        }

        static func demoMeat() -> ProductGroup {
            return ProductGroup(identifier: "meat", name: "Meat", productIDs: Product.demoCheeses().map { $0.identifier })
        }
    }

    struct Product {

        typealias ID = String

        let identifier: ID
        let name: String
        let producerID: Producer.ID
        let description: String
        let price: Double

        static func demoCheeses() -> [Product] {
            let cheese1 = Model.Product(identifier: "cheese1", name: "Small Cheese", producerID: Producer.cheeser().identifier, description: "A cheese.", price: 1.0)
            let cheese2 = Model.Product(identifier: "cheese2", name: "Medium Cheese", producerID: Producer.cheeser().identifier, description: "A cheese.", price: 2.0)
            let cheese3 = Model.Product(identifier: "cheese3", name: "Large Cheese", producerID: Producer.cheeser().identifier, description: "A cheese.", price: 3.0)
            let cheese4 = Model.Product(identifier: "cheese4", name: "Goat Cheese", producerID: Producer.cheesey().identifier, description: "A pungent cheese.", price: 4.0)
            let cheese5 = Model.Product(identifier: "cheese5", name: "Sheep Cheese", producerID: Producer.cheesey().identifier, description: "An expensive cheese.", price: 5.0)

            return [cheese1, cheese2, cheese3, cheese4, cheese5]
        }

        static func demoMeats() -> [Product] {
            let meat1 = Model.Product(identifier: "meat1", name: "Small Meat", producerID: Producer.meater().identifier, description: "A meat.", price: 1.0)
            let meat2 = Model.Product(identifier: "meat2", name: "Medium Meat", producerID: Producer.meater().identifier, description: "A meat.", price: 2.0)
            let meat3 = Model.Product(identifier: "meat3", name: "Large Meat", producerID: Producer.meater().identifier, description: "A meat.", price: 3.0)
            let meat4 = Model.Product(identifier: "meat4", name: "Goat Fish", producerID: Producer.fishey().identifier, description: "A pungent meat.", price: 4.0)
            let meat5 = Model.Product(identifier: "meat5", name: "Sheep Fish", producerID: Producer.fishey().identifier, description: "An expensive meat.", price: 5.0)

            return [meat1, meat2, meat3, meat4, meat5]
        }
    }

    struct Producer {
        
        typealias ID = String
        
        let identifier: ID
        let name: String
        let description: String

        static func cheeser() -> Producer {
            return Producer(identifier: "Cheeser", name: "Cheeser", description: "Differently sized cheeses.")
        }

        static func cheesey() -> Producer {
            return Producer(identifier: "Cheesey", name: "Cheesey", description: "Differently sourced cheeses.")
        }

        static func meater() -> Producer {
            return Producer(identifier: "Meater", name: "Meater", description: "Differently sized meats.")
        }

        static func fishey() -> Producer {
            return Producer(identifier: "Fishey", name: "Fishey", description: "Differently sourced fishes.")
        }
    }
}

