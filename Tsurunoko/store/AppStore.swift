//
//  AppStore.swift
//  Tsurunoko
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

typealias AuthenticationState = Bool

struct AppState: StateType, HasNavigationState {

    var navigationState: NavigationState

    let selected: Model.Selected

    let catalog: Catalog

    let authenticated: Bool
//    let user: Model.User
    let cart: Model.Cart
//    let orders: [Model.Order]
//    let addresses: [Model.Address]
//    let paymentMethods: [Model.PaymentMethod]
}

// TODO: <ARLO> make a real reducer
struct AppReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            navigationState: NavReducer.handleAction(action, state: state),
            selected: SelectedReducer.handleAction(action, state: state?.selected),
            catalog: DemoCatalog(),
            authenticated: AuthReducer.handleAction(action, state: state?.authenticated),
            cart: CartReducer.handleAction(action, state: state?.cart)
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

enum SelectedReducer {

    static func handleAction(_ action: Action, state optState: Model.Selected?) -> Model.Selected {
        guard var state = optState else {
            return Model.Selected()
        }

        switch action {
        case let productGroup as SelectProductGroup:
            state.productGroupID = productGroup.identifier
            return state
        case is DeselectProductGroup:
            state.productGroupID = nil
            return state
        case let product as SelectProduct:
            state.productID = product.identifier
            return state
        case is DeselectProduct:
            state.productID = nil
            return state
        default:
            return state
        }
    }
}

enum AuthReducer {

    static func handleAction(_ action: Action, state optState: AuthenticationState?) -> AuthenticationState {
        guard let state = optState else {
            return false
        }

        if action is DidAuthenticate {
            return true
        }

        return state
    }
}

enum CartReducer {

    static func handleAction(_ action: Action, state optState: Model.Cart?) -> Model.Cart {
        guard var state = optState else {
            return Model.Cart()
        }

        if let changeQuantityAction = action as? ChangeProductQuantity {

            let productID: Model.Product.ID
            let quantity: Int
            let relative: Bool
            switch changeQuantityAction {
            case let .decrement(id):
                productID = id
                quantity = -1
                relative = true
            case let .increment(id):
                productID = id
                quantity = 1
                relative = true
            case let .set(q, id):
                productID = id
                quantity = q
                relative = false
            }

            if let (index, cartItem) = state.items.enumerated().first(where: { productID == $0.1.productID }) {
                let newQuantity = relative ? cartItem.quantity + quantity : quantity
                if newQuantity < 1 {
                    state.items.remove(at: index)
                } else {
                    let newCartItem = Model.CartItem(productID: cartItem.productID, quantity: newQuantity)
                    state.items.replaceSubrange(index..<index+1, with: [newCartItem])
                }
            } else if quantity > 0 {
                let newCartItem = Model.CartItem(productID: productID, quantity: quantity)
                state.items.append(newCartItem)
            }

            return state
        }


        return state
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

