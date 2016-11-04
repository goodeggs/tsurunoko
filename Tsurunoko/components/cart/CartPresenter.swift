//
//  CartPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

protocol CartPresenter {

    func subscribe()
    func unsubscribe()
    func selectedProduct(with identifier: String)
    func deselectedProduct(with identifier: String)
}

protocol CartView: class {

    func render(viewModel: Cart.ViewModel)
}

extension Cart {

    final class PresenterImpl: StoreSubscriber, CartPresenter {

        let store: AppStore
        weak var view: CartView?

        init(store: AppStore, view: CartView) {
            self.store = store
            self.view = view
        }

        func subscribe() {
            self.store.subscribe(self)
        }

        func unsubscribe() {
            self.store.unsubscribe(self)
        }

        // MARK: - StoreSubscriber

        func newState(state: AppState) {
            guard let view = self.view else {
                return
            }

            let cellViewModels = state.cart.items.map({ (cartItem) in
                return (cartItem, state.catalog.products.first(where: { cartItem.productID == $0.identifier })!)
            }).map { (cartItem, product) -> CellViewModel in
                return CellViewModel(
                    identifier: product.identifier,
                    title: product.name,
                    detail: product.description,
                    quantity: String(cartItem.quantity),
                    price: product.price.formatAsLocalCurrency()
                )
            }

            let viewModel = Cart.ViewModel(cellViewModels: cellViewModels)
            view.render(viewModel: viewModel)
        }

        // MARK: - CartPresenter

        func selectedProduct(with identifier: String) {
            var route = self.store.state.navigationState.route
            route.append(Product.identifier)
            self.store.dispatch(SelectProduct(identifier: identifier))
            self.store.dispatch(SetRouteAction(route))

        }

        func deselectedProduct(with identifier: String) {
            self.store.dispatch(DeselectProduct())
        }
    }
}
