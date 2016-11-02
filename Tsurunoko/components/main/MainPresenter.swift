//
//  MainPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit
import ReSwiftRouter

protocol MainPresenter {

    func showTab(for viewController: UIViewController)
}

extension Main {

    struct PresenterImpl: MainPresenter {

        let store: AppStore
        let routeMap: RouteMap

        init(store: AppStore, routeMap: RouteMap) {
            self.store = store
            self.routeMap = routeMap
        }

        func showTab(for viewController: UIViewController) {

            guard let (route, _) = self.routeMap.first(where: { (route: RouteElementIdentifier, component: Component) -> Bool in
                viewController === component.viewController
            }) else {
                fatalError("Unable to find matching root for tab view controller.")
            }

            self.store.dispatch(
                SetRouteAction([Main.identifier, route])
            )
        }
    }
}

