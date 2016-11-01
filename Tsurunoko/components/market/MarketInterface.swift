//
//  MarketInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Market: ComponentInterface {

    static var identifier = "Market"

    static func newComponent() -> Component {
        let router = MarketRouter()
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! MarketViewController
        let navController = UINavigationController(rootViewController: viewController)
        return BasicComponent(router: router, rootViewController: navController)
    }
}

