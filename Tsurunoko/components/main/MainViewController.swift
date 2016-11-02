//
//  MainViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {

    var presenter: MainPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MainViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        self.presenter.showTab(for: viewController)
        return false
    }
}

