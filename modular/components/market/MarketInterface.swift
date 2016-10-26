//
//  MarketInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

enum Market: Component {

    func rootViewController() -> UIViewController {
        return UIStoryboard(name: "Market", bundle: nil).instantiateInitialViewController()!
    }
}