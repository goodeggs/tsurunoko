//
//  MainInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

enum Main: ComponentInterface {

    static var identifier = "Main"

    static func newComponent() -> Component {

        let market = Market.newComponent()
        let cart = Cart.newComponent()

        let mainViewController = MainViewController()
        mainViewController.viewControllers = [market.rootViewController, cart.rootViewController]

        let routeMap = [
            Market.identifier: market,
            Cart.identifier: cart
        ]
        let router = Main.Router(mainViewController: mainViewController, routeMap: routeMap)

        mainViewController.delegate = router
        
        return router
    }
}

