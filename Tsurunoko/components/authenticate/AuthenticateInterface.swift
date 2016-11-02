//
//  AuthenticateInterface.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

enum Authenticate: ComponentInterface {

    static var identifier = "Authenticate"

    private static func presenter(store: AppStore) -> AuthenticatePresenter {
        return PresenterImpl(store: store)
    }

    private static func viewController(presenter: AuthenticatePresenter) -> UIViewController {
        let denyAction = UIAlertAction(title: "Deny", style: .cancel, handler: { (_) in presenter.didCancel() })
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: { (_) in presenter.didAuthenticate() })
        let alertController = UIAlertController(title: "Hello", message: "Confirm your identity!", preferredStyle: .alert)
        alertController.addAction(denyAction)
        alertController.addAction(confirmAction)
        alertController.preferredAction = confirmAction
        return alertController
    }

    private static func router(viewController: UIViewController) -> Routable {
        return Authenticate.Router()
    }

    static func newComponent(store: AppStore) -> Component {
        let presenter = self.presenter(store: store)
        let viewController = self.viewController(presenter: presenter)
        let router = self.router(viewController: viewController)
        return BasicComponent(router: router, viewController: viewController)
    }
}

