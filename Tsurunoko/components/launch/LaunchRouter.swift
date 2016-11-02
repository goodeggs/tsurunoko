//
//  LaunchRouter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

final class LaunchRouter: Routable {

    lazy var window: UIWindow = {
        return UIWindow(frame: UIScreen.main.bounds)
    }()

    let store: AppStore

    init(store: AppStore) {
        self.store = store
    }

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

    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                         animated: Bool,
                         completionHandler: @escaping RoutingCompletionHandler) {
        completionHandler() // called when switching between landing and main, nothing to do here
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
            component = Landing.newComponent(store: store)
        case .Main:
            component = Main.newComponent(store: store)
        }

        self.window.rootViewController = component.viewController
        self.window.makeKeyAndVisible()

        return component.router
    }
}

