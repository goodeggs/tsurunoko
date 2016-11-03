//
//  Address.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Model {

    struct Address {

        typealias ID = String

        let id: ID
        let street: String
        let city: String
        let state: String
        let zipCode: String
    }
}

