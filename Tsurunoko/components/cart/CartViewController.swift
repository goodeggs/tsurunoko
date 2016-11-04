//
//  CartViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class CartViewController: UITableViewController {

    var presenter: CartPresenter!
    var viewModel = Cart.ViewModel()

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

// MARK: - CartView

extension CartViewController: CartView {

    func render(viewModel: Cart.ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

// MARK: - Table display

extension CartViewController {

    func viewModel(for indexPath: IndexPath) -> Cart.CellViewModel {
        return self.viewModel.cellViewModels[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCellView.identifier, for: indexPath) as! CartItemCellView
        let cellViewModel = self.viewModel(for: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
}

extension CartItemCellView {

    func configure(with viewModel: Cart.CellViewModel) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.detail
        self.quantityLabel.text = viewModel.quantity
        self.priceLabel.text = viewModel.price
    }
}

// MARK: - Table interaction

extension CartViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cellViewModel = self.viewModel(for: indexPath)
        self.presenter.selectedProduct(with: cellViewModel.identifier)
    }

    // TODO: <ARLO> this method is not getting called, no idea why
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        let cellViewModel = self.viewModel(for: indexPath)
        self.presenter.deselectedProduct(with: cellViewModel.identifier)
    }
}

