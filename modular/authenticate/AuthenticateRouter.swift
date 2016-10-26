//
//  AuthenticateRouter.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

class AuthenticateRouter: Routable {

    func changeRouteSegment(_ from: RouteElementIdentifier,
                            to: RouteElementIdentifier,
                            animated: Bool,
                            completionHandler: RoutingCompletionHandler) -> Routable {

        completionHandler()
        return self
    }

    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                          animated: Bool,
                          completionHandler: RoutingCompletionHandler) -> Routable {

        completionHandler()
        return self
    }

    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                         animated: Bool,
                         completionHandler: RoutingCompletionHandler) {

        completionHandler()
    }
}

