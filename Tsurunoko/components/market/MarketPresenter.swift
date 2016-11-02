//
//  MarketPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift

protocol MarketPresenter {

    func subscribe()
    func unsubscribe()
    func showProduct(with identifier: Model.Product.ID)
}

extension Market {

    final class PresenterImpl: StoreSubscriber, MarketPresenter {

        let store: AppStore
        weak var viewController: MarketViewController?

        init(store: AppStore, viewController: MarketViewController) {
            self.store = store
            self.viewController = viewController
        }

        func subscribe() {
            self.store.subscribe(self)
        }

        func unsubscribe() {
            self.store.unsubscribe(self)
        }

        // MARK: - StoreSubscriber

        func newState(state: AppState) {
            let cellViewModels = state.market.productGroupIDs.map({ (productGroupID) -> Model.ProductGroup in
                return state.productGroups.first(where: { productGroupID == $0.identifier })!
            }).map { (productGroup) -> CellViewModel in
                return CellViewModel(title: productGroup.name, detail: "\(productGroup.productIDs.count) items")
            }
            let viewModel = Market.ViewModel(cellViewModels: cellViewModels)
            self.viewController?.render(viewModel: viewModel)
        }

        // MARK: - MarketPresenter

        func showProduct(with identifier: Model.Product.ID) {

        }
    }
}
