//
//  LandingPresenter.swift
//  modular
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

        func showAuthenticationModal() {
            mainStore.dispatch(SetRouteAction([Landing.identifier, Authenticate.identifier])) // TODO: <ARLO> would like to push route here
        }
    }
}

