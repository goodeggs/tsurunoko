//
//  AppStore.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

struct AppStore: StateType, HasNavigationState {

    var navigationState: NavigationState

    let market: Model.Market
    let productGroups: [Model.ProductGroup]
    let products: [Model.Product]
    let producers: [Model.Producer]

    let user: Model.User
    let cart: Model.Cart
    let orders: [Model.Order]
    let addresses: [Model.Address]
    let paymentMethods: [Model.PaymentMethod]
}
