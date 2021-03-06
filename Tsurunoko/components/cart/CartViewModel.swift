//
//  CartViewModel.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Cart {

    struct ViewModel {

        let cellViewModels: [CellViewModel]
    }

    struct CellViewModel {

        let identifier: String
        let title: String
        let detail: String
        let quantity: String
        let price: String
    }
}

extension Cart.ViewModel {

    init() {
        cellViewModels = []
    }
}

