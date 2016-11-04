//
//  MainPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import ReSwiftRouter

protocol MainPresenter {

    func subscribe()
    func unsubscribe()
    func showMarket()
    func showCart()
}

protocol MainView: class {

    func render(viewModel: Main.ViewModel)
}

extension Main {

    final class PresenterImpl: StoreSubscriber, MainPresenter {

        let store: AppStore
        weak var view: MainView?

        init(store: AppStore) {
            self.store = store
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

            let cartItemsCount = state.cart.items.count
            let badgeValue = cartItemsCount > 0 ? String(cartItemsCount) : nil
            let viewModel = ViewModel(cartBadgeValue: badgeValue)

            view.render(viewModel: viewModel)
        }

        // MARK: - MainPresenter

        func showMarket() {
            self.store.dispatch(SetRouteAction([Main.identifier, Market.identifier]))
        }

        func showCart() {
            self.store.dispatch(SetRouteAction([Main.identifier, Cart.identifier]))
        }
    }
}

