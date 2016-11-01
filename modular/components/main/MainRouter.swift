//
//  MainRouter.swift
//  modular
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

        let mainViewController: MainViewController
        let routeMap: [RouteElementIdentifier: Component]

        init(mainViewController: MainViewController, routeMap: [RouteElementIdentifier: Component]) {
            self.mainViewController = mainViewController
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

            guard route != Main.identifier else {
                return self
            }

            guard let component = routeMap[route] else {
                fatalError("Unable to handle route to '\(route)'.")
            }

            guard let tabViewControllers = mainViewController.viewControllers,
                let index = tabViewControllers.index(of: component.rootViewController) else {
                    fatalError("Unable to find view controller from routeMap in tab bar.")
            }

            mainViewController.selectedIndex = index
            return component.router
        }
    }
}

extension Main.Router: Component {

    var rootViewController: UIViewController {
        return mainViewController
    }

    var router: Routable {
        return self
    }
}

extension Main.Router: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        guard let (route, _) = self.routeMap.first(where: { (key: RouteElementIdentifier, value: Component) -> Bool in
            viewController === value.rootViewController
        }) else {
            fatalError("Unable to find matching root for tab view controller.")
        }

        mainStore.dispatch(
            SetRouteAction([Main.identifier, route])
        )

        return false
    }
}

