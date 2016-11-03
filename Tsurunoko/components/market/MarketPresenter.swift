//
//  MarketPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

protocol MarketPresenter {

    func subscribe()
    func unsubscribe()
    func showProductGroup(with identifier: String)
}

protocol MarketView: class {

    func render(viewModel: Market.ViewModel)
}

extension Market {

    final class PresenterImpl: StoreSubscriber, MarketPresenter {

        let store: AppStore
        weak var view: MarketView?

        init(store: AppStore, view: MarketView) {
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

            let cellViewModels = state.market.productGroupIDs.map({ (productGroupID) -> Model.ProductGroup in
                return state.productGroups.first(where: { productGroupID == $0.identifier })!
            }).map { (productGroup) -> CellViewModel in
                return CellViewModel(identifier: productGroup.identifier, title: productGroup.name, detail: "\(productGroup.productIDs.count) items")
            }

            let viewModel = Market.ViewModel(cellViewModels: cellViewModels)
            view.render(viewModel: viewModel)
        }

        // MARK: - MarketPresenter

        func showProductGroup(with identifier: String) {
            var route = self.store.state.navigationState.route
            route.append(ProductGroup.identifier)
            self.store.dispatch(SelectProductGroup(identifier: identifier))
            self.store.dispatch(SetRouteAction(route))
        }
    }
}
