//
//  User.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/25/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import Foundation

extension Model {

    struct User {

        typealias ID = String

        let id: ID
        let name: String
        let email: String
        let password: String
    }
}

