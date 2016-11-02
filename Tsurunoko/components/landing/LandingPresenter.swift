//
//  LandingPresenter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/31/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import ReSwiftRouter

protocol LandingPresenter {

    func showAuthenticationModal()
}

extension Landing {

    struct PresenterImpl: LandingPresenter {

        let store: AppStore

        func showAuthenticationModal() {
            self.store.dispatch(SetRouteAction([Landing.identifier, Authenticate.identifier])) // TODO: <ARLO> would like to push route here
        }
    }
}

