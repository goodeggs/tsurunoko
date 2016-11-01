//
//  LandingViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class LandingViewController: UIViewController {

    var presenter: LandingPresenter!

    // MARK: - Views

    @IBOutlet weak var authenticateButton: UIButton!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Interaction

    @IBAction func authenticateTapped(_ sender: AnyObject) {
        self.presenter.showAuthenticationModal()
    }
}

