//
//  AuthenticatePresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/31/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

protocol AuthenticatePresenter {

    func didAuthenticate()
    func didCancel()
}

extension Authenticate {

    struct PresenterImpl: AuthenticatePresenter {

        let store: AppStore

        func didAuthenticate() {
            self.store.dispatch(DidAuthenticate())
            self.store.dispatch(SetRouteAction([Main.identifier]))
        }

        func didCancel() {
            var route = self.store.state.navigationState.route
            _ = route.popLast()
            self.store.dispatch(SetRouteAction(route))
        }
    }
}

