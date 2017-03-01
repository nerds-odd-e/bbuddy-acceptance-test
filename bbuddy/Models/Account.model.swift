//
//  Account.swift
//  bbuddy
//
//  Created by Jackson Zhang on 14/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation

class Account {
    private var api:Api
    var id = 0
    var name = ""
    var balance = 0

    convenience init(){
        self.init(api: Api())
    }

    init(api: Api){
        self.api = api
    }
    
    func save(_ action: @escaping () -> Void){
        let accountToUpdate = DTO.Account(id: id, name: name, balance: balance)
        id == 0 ? api.addAccount(accountToUpdate, to: action) : api.updateAccount(accountToUpdate, to: action)
    }

    class func from(_ dto: DTO.Account) -> Account! {
        let account = Account()
        account.id = dto.id
        account.name = dto.name
        account.balance = dto.balance
        return account
    }
}
