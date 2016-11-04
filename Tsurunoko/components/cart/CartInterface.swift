//
//  CartInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

enum Cart {

    static var identifier = "Cart"

    static func newComponent(store: AppStore) -> Component {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! CartViewController
        let presenter = Cart.PresenterImpl(store: store, view: viewController)
        viewController.presenter = presenter
        let navController = UINavigationController(rootViewController: viewController)
        let router = Cart.Router(store: store, viewController: navController)
        return BasicComponent(router: router, viewController: navController)
    }
}

