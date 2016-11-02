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
    func showProduct(with identifier: String)
}

protocol ProductGroupView: class {

    func render(viewModel: ProductGroup.ViewModel)
}

extension ProductGroup {

    final class PresenterImpl: StoreSubscriber, ProductGroupPresenter {

        let store: AppStore
        weak var view: ProductGroupView?
        let productGroupID: Model.ProductGroup.ID = "cheese"

        init(store: AppStore, view: ProductGroupView) {
            self.store = store
            self.view = view
        }

        func subscribe() {
            self.store.subscribe(self, selector: { return $0.catalog })
        }

        func unsubscribe() {
            self.store.unsubscribe(self)
        }

        // MARK: - StoreSubscriber

        func newState(state: Catalog) {
            guard let view = self.view else {
                return
            }

            guard let productGroup = state.productGroups.first(where: { self.productGroupID == $0.identifier }) else {
                fatalError("unable to find product group with identifier: \(self.productGroupID)")
            }

            let cellViewModels = productGroup.productIDs.map({ (productID) -> Model.Product in
                return state.products.first(where: { productID == $0.identifier })!
            }).map { (product) -> CellViewModel in
                return CellViewModel(identifier: product.identifier, title: product.name, detail: product.description)
            }

            let viewModel = ProductGroup.ViewModel(cellViewModels: cellViewModels)
            view.render(viewModel: viewModel)
        }

        // MARK: - ProductGroupPresenter

        func showProduct(with identifier: String) {

        }
    }
}
