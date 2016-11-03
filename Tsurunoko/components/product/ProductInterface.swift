//
//  ProductInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

enum Product {

    static var identifier = "Product"

    static func newComponent(store: AppStore, navigationController: UINavigationController) -> Component {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! ProductViewController
        let presenter = Product.PresenterImpl(store: store, view: viewController)
        viewController.presenter = presenter
        let router = Product.Router()
        return BasicComponent(router: router, viewController: viewController)
    }
}

enum ChangeProductQuantity: Action {

    case increment(productID: Model.Product.ID)
    case decrement(productID: Model.Product.ID)
    case set(to: Int, productID: Model.Product.ID)
}

