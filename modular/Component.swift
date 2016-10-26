//
//  Component.swift
//  modular
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

protocol Component {

    static var identifier: String { get }
    static func rootViewController() -> UIViewController
}

extension Component {

    static func rootViewController() -> UIViewController {
        return UIStoryboard(name: self.identifier, bundle: nil).instantiateInitialViewController()!
    }
}
