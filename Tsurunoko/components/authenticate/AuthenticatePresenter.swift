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
            self.store.dispatch(SetRouteAction([Main.identifier]))
        }

        func didCancel() {
            self.store.dispatch(SetRouteAction([Landing.identifier])) // TODO: <ARLO> would like to pop here
        }
    }
}
