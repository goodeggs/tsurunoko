//
//  LandingInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

enum Landing {

    static var identifier = "Landing"

    private static func presenter(store: AppStore) -> LandingPresenter {
        return PresenterImpl(store: store)
    }

    private static func viewController(presenter: LandingPresenter) -> UIViewController {
        let viewController = UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController() as! LandingViewController
        viewController.presenter = presenter
        return viewController
    }

    private static func router(store: AppStore, viewController: UIViewController) -> Routable {
        return Landing.Router(store: store, viewController: viewController)
    }

    static func newComponent(store: AppStore) -> Component {
        let presenter = self.presenter(store: store)
        let viewController = self.viewController(presenter: presenter)
        let router = self.router(store: store, viewController: viewController)
        return BasicComponent(router: router, viewController: viewController)
    }
}

