//
//  Account.swift
//  bbuddy
//
//  Created by Jackson Zhang on 08/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

extension DTO{
    struct Account {
        var id: Int = 0
        var name: String = ""
        var balance: Int = 0
    }
}

extension DTO.Account: Decodable {
    static func decode(_ json: JSON) -> Decoded<DTO.Account> {
        return curry(DTO.Account.init)
            <^> json <| "id"
            <*> json <| "name"
            <*> json <| "balance"
    }
}
