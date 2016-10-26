//
//  MarketInterface.swift
//  modular
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
        return ComponentImpl(router: router, rootViewController: viewController)
    }
}

