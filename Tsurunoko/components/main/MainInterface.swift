//
//  MainInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

enum Main: ComponentInterface {

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

        return BasicComponent(router: router, viewController: mainViewController)
    }
}

