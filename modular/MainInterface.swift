//
//  MainInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Main: Component {

    static var identifier = "Main"

    static func rootViewController() -> UIViewController {

        let marketViewController = Market.rootViewController()
        let cartViewController = Cart.rootViewController()

        let mainViewController = MainViewController()
        mainViewController.viewControllers = [marketViewController, cartViewController]
        mainViewController.delegate = mainViewController
        
        return mainViewController
    }
}

extension MainViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        if viewController is MarketViewController {
//            mainStore.dispatch(
//                SetRouteAction([Main.identifier, Market.identifier])
//            )
        } else if viewController is CartViewController {
//            mainStore.dispatch(
//                SetRouteAction([Main.identifier, Cart.identifier])
//            )
        }

        return false
    }
}

