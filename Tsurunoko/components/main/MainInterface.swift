//
//  MainInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

enum Main {

    static var identifier = "Main"

    static func newComponent(store: AppStore) -> Component {

        let market = Market.newComponent(store: store)
        let cart = Cart.newComponent(store: store)

        let routeMap = [
            Market.identifier: market,
            Cart.identifier: cart
        ]

        let mainViewController = MainViewController()
        mainViewController.viewControllers = [market.viewController, cart.viewController]
        mainViewController.delegate = mainViewController
        mainViewController.presenter = Main.PresenterImpl(store: store, routeMap: routeMap)

        let router = Main.Router(store: store, viewController: mainViewController, routeMap: routeMap)

        let cartBadgeController = TabBadgeController(tabBarItem: cart.viewController.tabBarItem, store: store) { state in
            let cartItemsCount = state.cart.items.count
            return cartItemsCount > 0 ? String(cartItemsCount) : nil
        }

        _ = TabBadgeControllers.shared.add(cartBadgeController)

        return BasicComponent(router: router, viewController: mainViewController)
    }
}

final class TabBadgeControllers {

    typealias Identifier = UUID

    static let shared = TabBadgeControllers()

    var controllers: [Identifier: TabBadgeController] = [:]

    init() {

    }

    func add(_ controller: TabBadgeController) -> Identifier {
        let identifier = UUID()
        self.controllers[identifier] = controller
        return identifier
    }

    func remove(_ identifier: Identifier) {
        self.controllers[identifier] = nil
    }
}

final class TabBadgeController: StoreSubscriber {

    typealias BadgeValueForState = (AppState) -> String?

    let tabBarItem: UITabBarItem
    let badgeValue: BadgeValueForState

    init(tabBarItem: UITabBarItem, store: AppStore, badgeValue: @escaping BadgeValueForState) {
        self.tabBarItem = tabBarItem
        self.badgeValue = badgeValue
        store.subscribe(self)
    }

    func newState(state: AppState) {

        self.tabBarItem.badgeValue = self.badgeValue(state)
    }
}

