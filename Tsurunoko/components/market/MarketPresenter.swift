//
//  MarketPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift

extension Market {

    final class Presenter: StoreSubscriber {

        let store: AppStore
        weak var viewController: MarketViewController?

        init(store: AppStore, viewController: MarketViewController) {
            self.store = store
            self.viewController = viewController
        }

        func newState(state: AppState) {
            let viewModel = Market.ViewModel()
            self.viewController?.render(viewModel: viewModel)
        }
    }
}
