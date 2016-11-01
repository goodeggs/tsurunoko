//
//  LaunchRouter.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

class LaunchRouter: Routable {

    lazy var window: UIWindow = {
        return UIWindow(frame: UIScreen.main.bounds)
    }()

    enum ValidRoute: String {
        case Landing, Main
    }

    func changeRouteSegment(_ from: RouteElementIdentifier,
                            to: RouteElementIdentifier,
                            animated: Bool,
                            completionHandler: @escaping RoutingCompletionHandler) -> Routable {

        return showViewController(for: to, animated: animated, completionHandler: completionHandler)
    }

    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                          animated: Bool,
                          completionHandler: @escaping RoutingCompletionHandler) -> Routable {

        return showViewController(for: routeElementIdentifier, animated: animated, completionHandler: completionHandler)
    }

    func showViewController(for routeIdentifier: RouteElementIdentifier,
                            animated: Bool,
                            completionHandler: RoutingCompletionHandler) -> Routable {

        guard let route = ValidRoute(rawValue: routeIdentifier) else {
            fatalError("Unexpected routeIdentifier \(routeIdentifier).")
        }

        defer {
            completionHandler()
        }

        let component: Component
        switch route {
        case .Landing:
            component = Landing.newComponent()
        case .Main:
            component = Main.newComponent()
        }

        self.window.rootViewController = component.rootViewController
        self.window.makeKeyAndVisible()

        return component.router
    }
}

