//
//  ProductGroupPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

protocol ProductGroupPresenter {

    func subscribe()
    func unsubscribe()
    func selectedProduct(with identifier: String)
    func deselectedProduct(with identifier: String)
    func willPopView()
}

protocol ProductGroupView: class {

    func render(viewModel: ProductGroup.ViewModel)
}

extension ProductGroup {

    final class PresenterImpl: StoreSubscriber, ProductGroupPresenter {

        let store: AppStore
        weak var view: ProductGroupView?

        var productGroupID: Model.ProductGroup.ID {
            return self.store.state.selected.productGroupID!
        }

        init(store: AppStore, view: ProductGroupView) {
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

            guard let productGroup = state.catalog.productGroups.first(where: { self.productGroupID == $0.identifier }) else {
                fatalError("unable to find product group with identifier: \(self.productGroupID)")
            }

            let cellViewModels = productGroup.productIDs.map({ (productID) -> Model.Product in
                return state.catalog.products.first(where: { productID == $0.identifier })!
            }).map { (product) -> CellViewModel in
                return CellViewModel(identifier: product.identifier, title: product.name, detail: product.description)
            }

            let viewModel = ProductGroup.ViewModel(title: productGroup.name, cellViewModels: cellViewModels)
            view.render(viewModel: viewModel)
        }

        // MARK: - ProductGroupPresenter

        func selectedProduct(with identifier: String) {
            var route = self.store.state.navigationState.route
            route.append(Product.identifier)
            self.store.dispatch(SelectProduct(identifier: identifier))
            self.store.dispatch(SetRouteAction(route))

        }

        func deselectedProduct(with identifier: String) {
            self.store.dispatch(DeselectProduct())
        }

        func willPopView() {
            var route = self.store.state.navigationState.route
            _ = route.popLast()
            self.store.dispatch(SetRouteAction(route))
        }
    }
}
