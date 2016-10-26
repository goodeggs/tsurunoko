//
//  CartInterface.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

enum Cart: Component {

    func rootViewController() -> UIViewController {
        return UIStoryboard(name: "Cart", bundle: nil).instantiateInitialViewController()!
    }
}
