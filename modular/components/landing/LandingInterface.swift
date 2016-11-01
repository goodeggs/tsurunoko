//
//  LandingInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

enum Landing: ComponentInterface {

    static var identifier = "Landing"

    private static func presenter() -> LandingPresenter {
        return PresenterImpl()
    }

    private static func viewController(presenter: LandingPresenter) -> UIViewController {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! LandingViewController
        viewController.presenter = presenter
        return UINavigationController(rootViewController: viewController)
    }

    private static func router(viewController: UIViewController) -> Routable {
        return Landing.Router(viewController: viewController)
    }

    static func newComponent() -> Component {
        let presenter = self.presenter()
        let viewController = self.viewController(presenter: presenter)
        let router = self.router(viewController: viewController)
        return ComponentImpl(router: router, rootViewController: viewController)
    }
}

