//
//  ProductPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

protocol ProductPresenter {

    func subscribe()
    func unsubscribe()
    func willPopView()
    func decrementProductQuantity()
    func incrementProductQuantity()
}

protocol ProductView: class {

    func render(viewModel: Product.ViewModel)
}

extension Product {

    final class PresenterImpl: StoreSubscriber, ProductPresenter {

        let store: AppStore
        weak var view: ProductView?
        var productID: Model.Product.ID?

        init(store: AppStore, view: ProductView) {
            self.store = store
            self.view = view
        }

        func subscribe() {
            let route = self.store.state.navigationState.route
            self.productID = self.store.state.navigationState.getRouteSpecificState(route)
            self.store.subscribe(self)
        }

        func unsubscribe() {
            self.productID = nil
            self.store.unsubscribe(self)
        }

        // MARK: - StoreSubscriber

        func newState(state: AppState) {
            guard let view = self.view,
                let productID = self.productID else {
                return
            }

            guard let product = state.catalog.products.first(where: { productID == $0.identifier }) else {
                fatalError("unable to find product with identifier: \(productID)")
            }

            guard let producer = state.catalog.producers.first(where: { product.producerID == $0.identifier }) else {
                fatalError("unable to find product with identifier: \(productID)")
            }

            let viewModel = self.viewModel(
                product: product,
                producer: producer,
                cart: state.cart
            )
            view.render(viewModel: viewModel)
        }

        func viewModel(product: Model.Product, producer: Model.Producer, cart: Model.Cart) -> Product.ViewModel {
            let quantityInCart = cart.items.first(where: { $0.productID == product.identifier })?.quantity ?? 0
            return Product.ViewModel(
                title: product.name,
                detail: product.description,
                price: String(product.price), // TODO: <ARLO> money formatting
                quantity: String(quantityInCart),
                producerName: producer.name,
                incrementEnabled: quantityInCart < 10,
                decrementEnabled: quantityInCart > 0
            )
        }

        // MARK: - ProductPresenter

        func willPopView() {
            var route = self.store.state.navigationState.route
            _ = route.popLast()
            self.store.dispatch(SetRouteAction(route))
        }

        func decrementProductQuantity() {
            self.store.dispatch(ChangeProductQuantity.decrement(productID: self.productID!))
        }

        func incrementProductQuantity() {
            self.store.dispatch(ChangeProductQuantity.increment(productID: self.productID!))
        }
    }
}
