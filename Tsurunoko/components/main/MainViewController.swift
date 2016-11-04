//
//  MainViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class MainViewController: UITabBarController {

    var presenter: MainPresenter!

    var marketViewController: UIViewController!
    var cartViewController: UIViewController!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter.subscribe()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.presenter.unsubscribe()
    }

    // MARK: -

    func set(marketViewController: UIViewController, cartViewController: UIViewController) {
        self.marketViewController = marketViewController
        self.cartViewController = cartViewController

        self.viewControllers = [marketViewController, cartViewController]
        self.delegate = self

        self.marketViewController.tabBarItem = UITabBarItem(title: "Market", image: UIImage(named: "first"), selectedImage: nil)
        self.cartViewController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "second"), selectedImage: nil)
    }
}

extension MainViewController: MainView {

    func render(viewModel: Main.ViewModel) {
        self.cartViewController.tabBarItem.badgeValue = viewModel.cartBadgeValue
    }
}

extension MainViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        switch viewController {
        case marketViewController:
            self.presenter.showMarket()
        case cartViewController:
            self.presenter.showCart()
        default:
            fatalError("unexpected view controller in tab bar")
        }

        return false
    }
}

