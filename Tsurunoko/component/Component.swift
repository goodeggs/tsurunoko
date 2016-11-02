//
//  Component.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

protocol ComponentInterface {

    typealias ID = String

    static var identifier: ID { get }
    static func newComponent(store: AppStore) -> Component
}

protocol Component {

    var router: Routable { get }
    var viewController: UIViewController { get }
}

class BasicComponent: Component {

    var router: Routable
    var viewController: UIViewController

    init(router: Routable, viewController: UIViewController) {
        self.router = router
        self.viewController = viewController
    }
}

