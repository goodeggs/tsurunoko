//
//  CurrencyFormatter.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 11/3/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

let _localCurrencyFormatter = NumberFormatter().with({
    $0.numberStyle = .currency
})

extension SignedNumber {

    func formatAsLocalCurrency() -> String {
        return _localCurrencyFormatter.string(from: self as! NSNumber)!
    }
}

