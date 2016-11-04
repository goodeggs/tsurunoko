//
//  CartItemView.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/3/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation
import UIKit

final class CartItemCellView: UITableViewCell {

    static let identifier = "CartItemCellView"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
