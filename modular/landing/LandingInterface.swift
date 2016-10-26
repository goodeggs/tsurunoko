//
//  LandingInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Landing: ComponentInterface {

    static var identifier = "Landing"

    static func newComponent() -> Component {
        let router = LandingRouter()
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! LandingViewController
        let navController = UINavigationController(rootViewController: viewController)
        return ComponentImpl(router: router, rootViewController: navController)
    }
}

