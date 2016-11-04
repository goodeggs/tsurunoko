//
//  MarketInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

enum Market {

    static var identifier = "Market"

    static func newComponent(store: AppStore) -> Component {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! MarketViewController
        let presenter = Market.PresenterImpl(store: store, view: viewController)
        viewController.presenter = presenter
        let navController = UINavigationController(rootViewController: viewController)
        let router = Market.Router(store: store, viewController: navController)
        return BasicComponent(router: router, viewController: navController)
    }
}

struct SelectProductGroup: Action {

    let identifier: Model.ProductGroup.ID
}

struct DeselectProductGroup: Action {

}

