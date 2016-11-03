//
//  ProductViewController.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class ProductViewController: UIViewController {

    var presenter: ProductPresenter!
    var viewModel = Product.ViewModel()

    // MARK: - Views

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var producerNameLabel: UILabel!
    
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!

    // MARK: View lifecycle

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

    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)

        if parent == nil {
            self.presenter.willPopView()
        }
    }

    // MARK: - Actions

    @IBAction func decrementButtonTapped(_ sender: Any) {
        self.presenter.decrementProductQuantity()
    }

    @IBAction func incrementButtonTapped(_ sender: Any) {
        self.presenter.incrementProductQuantity()
    }

    @IBAction func producerButtonTapped(_ sender: Any) {

    }
}

// MARK: - ProductView

extension ProductViewController: ProductView {

    func render(viewModel: Product.ViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.detailLabel.text = viewModel.detail
        self.priceLabel.text = viewModel.price
        self.quantityLabel.text = viewModel.quantity
        self.producerNameLabel.text = viewModel.producerName
        self.decrementButton.isEnabled = viewModel.decrementEnabled
        self.incrementButton.isEnabled = viewModel.incrementEnabled
    }
}

