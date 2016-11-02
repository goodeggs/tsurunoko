//
//  MarketViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

class MarketViewController: UITableViewController {

    var viewModel: Market.ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func render(viewModel: Market.ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

