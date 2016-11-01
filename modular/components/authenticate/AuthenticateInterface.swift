//
//  AuthenticateInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

enum Authenticate: ComponentInterface {

    static var identifier = "Authenticate"

    private static func presenter() -> AuthenticatePresenter {
        return PresenterImpl()
    }

    private static func viewController(presenter: AuthenticatePresenter) -> UIViewController {
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: { (_) in presenter.didAuthenticate() })
        let denyAction = UIAlertAction(title: "Deny", style: .default, handler: { (_) in presenter.didCancel() })
        let alertController = UIAlertController(title: "Hello", message: "Confirm your identity!", preferredStyle: .alert)
        alertController.addAction(confirmAction)
        alertController.addAction(denyAction)
        return alertController
    }

    private static func router(viewController: UIViewController) -> Routable {
        return Authenticate.Router(viewController: viewController)
    }

    static func newComponent() -> Component {
        let presenter = self.presenter()
        let viewController = self.viewController(presenter: presenter)
        let router = self.router(viewController: viewController)
        return AuthenticateComponent(router: router, rootViewController: viewController, presenter: presenter)
    }
}

final class AuthenticateComponent: BasicComponent {

    let presenter: AuthenticatePresenter

    init(router: Routable, rootViewController: UIViewController, presenter: AuthenticatePresenter) {
        self.presenter = presenter
        super.init(router: router, rootViewController: rootViewController)
    }
}

