//
//  Order.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Model {

    struct Order {

        enum Status {
            case Pending, Placed, Fulfilled
        }

        typealias ID = String

        let id: ID
        let status: Status
        let products: [Product]
        let destination: Address?
        let deliveryDate: NSDate?
        let paymentMethod: PaymentMethod?
    }
}

