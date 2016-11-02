//
//  MainRouter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

extension Main {

    // NSObject in order to conform to UITabBarControllerDelegate
    final class Router: NSObject, Routable {

        let store: AppStore
        let viewController: UITabBarController
        let routeMap: RouteMap

        init(store: AppStore, viewController: UITabBarController, routeMap: RouteMap) {
            self.store = store
            self.viewController = viewController
            self.routeMap = routeMap
        }

        func changeRouteSegment(_ from: RouteElementIdentifier,
                                to: RouteElementIdentifier,
                                animated: Bool,
                                completionHandler: @escaping RoutingCompletionHandler) -> Routable {

            return selectTab(for: to, animated: animated, completionHandler: completionHandler)
        }

        func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                              animated: Bool,
                              completionHandler: @escaping RoutingCompletionHandler) -> Routable {

            return selectTab(for: routeElementIdentifier, animated: animated, completionHandler: completionHandler)
        }

        func selectTab(for route: RouteElementIdentifier,
                       animated: Bool,
                       completionHandler: RoutingCompletionHandler) -> Routable {

            defer {
                completionHandler()
            }

            guard let component = routeMap[route] else {
                fatalError("Unable to handle route to '\(route)'.")
            }

            guard let tabViewControllers = self.viewController.viewControllers,
                let index = tabViewControllers.index(of: component.viewController) else {
                    fatalError("Unable to find view controller from routeMap in tab bar.")
            }

            self.viewController.selectedIndex = index
            return component.router
        }
    }
}

