//
//  AppStore.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

struct AppStore {

    let navigationPath: String
    let market: MarketModel
    let productGroups: [ProductGroup]
    let products: [Product]
    let producers: [Producer]
    let orders: [Order]
    let carts: [Cart]
    let addresses: [Address]
}
