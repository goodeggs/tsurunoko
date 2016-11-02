//
//  LandingRouter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

extension Landing {

    final class Router: Routable {

        lazy var routeMap: RouteMap = {
            return [
                Authenticate.identifier: Authenticate.newComponent(store: self.store)
            ]
        }()

        let store: AppStore
        let viewController: UIViewController

        init(store: AppStore, viewController: UIViewController) {
            self.store = store
            self.viewController = viewController
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

            completionHandler() // UIKit dismisses the alert automatically
        }

        func showViewController(for routeIdentifier: RouteElementIdentifier,
                                animated: Bool,
                                completionHandler: RoutingCompletionHandler) -> Routable {

            guard let component = self.routeMap[routeIdentifier] else {
                fatalError("Unexpected routeIdentifier \(routeIdentifier).")
            }

            defer {
                completionHandler()
            }

            self.viewController.present(component.viewController, animated: true, completion: nil)

            return component.router
        }
    }
}

