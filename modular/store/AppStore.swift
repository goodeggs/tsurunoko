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

typealias AppStore = Store<AppState>

struct AppState: StateType, HasNavigationState {

    var navigationState: NavigationState

    let market: Model.Market
    let productGroups: [Model.ProductGroup]
    let products: [Model.Product]
    let producers: [Model.Producer]

    let authenticated: Bool
//    let user: Model.User
//    let cart: Model.Cart
//    let orders: [Model.Order]
//    let addresses: [Model.Address]
//    let paymentMethods: [Model.PaymentMethod]
}

// TODO: <ARLO> make a real reducer
struct AppReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        let navigationState: NavigationState
        if state == nil {
            navigationState = NavigationState()
        } else {
            navigationState = NavigationReducer.handleAction(action, state: state?.navigationState)
        }
        let market = Model.Market(id: "", productGroupIDs: [])
        return AppState(
            navigationState: navigationState,
            market: market,
            productGroups: [],
            products: [],
            producers: [],
            authenticated: false
        )
    }
}

// TODO: <ARLO> decide where redux middleware should live
let loggingMiddleware: Middleware = { dispatch, getState in
    return { next in
        return { action in
            print("> \(action)")
            return next(action)
        }
    }
}

