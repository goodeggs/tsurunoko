//
//  AuthenticateInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Authenticate: ComponentInterface {

    static var identifier = "Authenticate"

    static func newComponent() -> Component {
        let router = AuthenticateRouter()
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! AuthenticateViewController
        let navController = UINavigationController(rootViewController: viewController)
        return ComponentImpl(router: router, rootViewController: navController)
    }
}

