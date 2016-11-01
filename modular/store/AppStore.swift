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
import Then

extension NavigationState: Then {}

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
        let market = Model.Market(id: "", productGroupIDs: [])
        return AppState(
            navigationState: NavReducer.handleAction(action, state: state),
            market: market,
            productGroups: [],
            products: [],
            producers: [],
            authenticated: false
        )
    }
}

enum NavReducer {

    static func handleAction(_ action: Action, state optState: AppState?) -> NavigationState {
        guard let state = optState else {
            return NavigationState()
        }

        guard action is ApplicationDidFinishLaunching else {
            return NavigationReducer.handleAction(action, state: state.navigationState)
        }

        let initialRouteIdentifier = state.authenticated ? Main.identifier : Landing.identifier
        return state.navigationState.with {
            $0.route.append(initialRouteIdentifier)
        }
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

