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

        // MARK: - StoreSubscriber

        func newState(state: AppState) {
            let viewModel = Market.ViewModel()
            self.viewController?.render(viewModel: viewModel)
        }

        // MARK: - MarketPresenter

        func showProduct(with identifier: Model.Product.ID) {

        }
    }
}
