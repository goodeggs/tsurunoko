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
        mainViewController.set(marketViewController: market.viewController, cartViewController: cart.viewController)

        let presenter = Main.PresenterImpl(store: store)
        mainViewController.presenter = presenter
        presenter.view = mainViewController

        let router = Main.Router(store: store, viewController: mainViewController, routeMap: routeMap)

        return BasicComponent(router: router, viewController: mainViewController)
    }
}

