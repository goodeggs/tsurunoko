//
//  NavigationHandler.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/3/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class NavigationHandler: NSObject, UINavigationControllerDelegate {

    let completionHandler: () -> Void

    init(completionHandler: @escaping () -> Void) {
        self.completionHandler = completionHandler
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        completionHandler()
    }
}

