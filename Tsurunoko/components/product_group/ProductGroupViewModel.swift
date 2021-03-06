//
//  ProductGroupViewModel.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/1/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension ProductGroup {

    struct ViewModel {

        let title: String
        let cellViewModels: [CellViewModel]
    }

    struct CellViewModel {

        let identifier: String
        let title: String
        let detail: String
    }
}

extension ProductGroup.ViewModel {

    init() {
        title = ""
        cellViewModels = []
    }
}

