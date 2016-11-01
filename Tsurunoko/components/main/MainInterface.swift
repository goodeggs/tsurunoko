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
        // TODO: <ARLO> put these in navigation controllers so you can tell them apart
        let mainViewController = MainViewController()
        mainViewController.viewControllers = [market.rootViewController, cart.rootViewController]
        // TODO: <ARLO> add tab bar buttons

        let routeMap = [
            Market.identifier: market,
            Cart.identifier: cart
        ]
        let router = Main.Router(mainViewController: mainViewController, routeMap: routeMap)

        mainViewController.delegate = router
        
        return router
    }
}

