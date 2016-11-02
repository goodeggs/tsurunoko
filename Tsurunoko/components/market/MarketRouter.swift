//
//  MarketRouter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

extension Market {

    final class Router: Routable {

        lazy var routeMap: RouteMap = {
            return [
                ProductGroup.identifier: ProductGroup.newComponent(store: self.store)
            ]
        }()

        let store: AppStore
        let viewController: UINavigationController

        init(store: AppStore, viewController: UINavigationController) {
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

            completionHandler()
        }

        func showViewController(for routeIdentifier: RouteElementIdentifier,
                                animated: Bool,
                                completionHandler: @escaping RoutingCompletionHandler) -> Routable {

            guard let component = self.routeMap[routeIdentifier] else {
                fatalError("Unexpected routeIdentifier \(routeIdentifier).")
            }

            self.viewController.pushViewController(component.viewController, animated: true)

            completionHandler()

            return component.router
        }
    }
}

