//
//  ProductGroupInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum ProductGroup {

    static var identifier = "ProductGroup"

    static func newComponent(store: AppStore, navigationController: UINavigationController) -> Component {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! ProductGroupViewController
        let presenter = ProductGroup.PresenterImpl(store: store, view: viewController)
        viewController.presenter = presenter
        let router = ProductGroup.Router(store: store, viewController: navigationController)
        return BasicComponent(router: router, viewController: viewController)
    }
}

