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

    var presenter: MarketPresenter!
    var viewModel: Market.ViewModel = Market.ViewModel(cellViewModels: [])

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
}

// MARK: - MarketView

extension MarketViewController: MarketView {

    func render(viewModel: Market.ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

// MARK: - Table display

extension MarketViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath)
        let cellViewModel = self.viewModel.cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
}

extension UITableViewCell {

    func configure(with viewModel: Market.CellViewModel) {
        self.textLabel?.text = viewModel.title
        self.detailTextLabel?.text = viewModel.detail
    }
}

