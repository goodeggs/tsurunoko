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
    static func newComponent() -> Component
}

protocol Component {

    var router: Routable { get }
    var rootViewController: UIViewController { get }
}

class BasicComponent: Component {

    var router: Routable
    var rootViewController: UIViewController

    init(router: Routable, rootViewController: UIViewController) {
        self.router = router
        self.rootViewController = rootViewController
    }
}

final class PresenterComponent<P>: BasicComponent {

    let presenter: P

    init(router: Routable, rootViewController: UIViewController, presenter: P) {
        self.presenter = presenter
        super.init(router: router, rootViewController: rootViewController)
    }
}

