//
//  CartInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Cart: ComponentInterface {

    static var identifier = "Cart"

    static func newComponent(store: AppStore) -> Component {
        let router = CartRouter()
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! CartViewController
        let navController = UINavigationController(rootViewController: viewController)
        return BasicComponent(router: router, viewController: navController)
    }
}

