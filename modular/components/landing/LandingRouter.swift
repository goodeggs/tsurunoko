//
//  LandingRouter.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

extension Landing {

    final class Router: Routable {

        let viewController: UIViewController

        init(viewController: UIViewController) {
            self.viewController = viewController
        }

        enum ValidRoute: String {
            case Authenticate
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
            // TODO: <ARLO> handle cancelling the modal
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
            case .Authenticate:
                component = Authenticate.newComponent()
            }
            
            self.viewController.present(component.rootViewController, animated: true, completion: nil)
            
            return component.router
        }
    }
}

