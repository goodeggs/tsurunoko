//
//  ProductGroupViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class ProductGroupViewController: UITableViewController {

    var presenter: ProductGroupPresenter!
    var viewModel: ProductGroup.ViewModel = ProductGroup.ViewModel(cellViewModels: [])

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

// MARK: - ProductGroupView

extension ProductGroupViewController: ProductGroupView {

    func render(viewModel: ProductGroup.ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

// MARK: - Table display

extension ProductGroupViewController {

    func viewModel(for indexPath: IndexPath) -> ProductGroup.CellViewModel {
        return self.viewModel.cellViewModels[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductGroupCell", for: indexPath)
        let cellViewModel = self.viewModel(for: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
}

extension UITableViewCell {

    func configure(with viewModel: ProductGroup.CellViewModel) {
        self.textLabel?.text = viewModel.title
        self.detailTextLabel?.text = viewModel.detail
    }
}

// MARK: - Table interaction

extension ProductGroupViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = self.viewModel(for: indexPath)
        self.presenter.showProduct(with: cellViewModel.identifier)
    }
}

