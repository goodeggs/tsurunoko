//
//  ProductRouter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

extension Product {
    
    final class Router: Routable {

        func changeRouteSegment(_ from: RouteElementIdentifier,
                                to: RouteElementIdentifier,
                                animated: Bool,
                                completionHandler: @escaping RoutingCompletionHandler) -> Routable {

            completionHandler()
            return self
        }

        func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                              animated: Bool,
                              completionHandler: @escaping RoutingCompletionHandler) -> Routable {

            completionHandler()
            return self
        }

        func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                             animated: Bool,
                             completionHandler: @escaping RoutingCompletionHandler) {

            completionHandler()
        }
    }
}

