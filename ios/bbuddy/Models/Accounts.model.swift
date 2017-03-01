//
// Created by Jackson Zhang on 21/02/2017.
// Copyright (c) 2017 odd-e. All rights reserved.
//

import Foundation

class Accounts {
    private var accounts = Array<DTO.Account>()
    private var api: Api

    var count: Int {
        return accounts.count
    }

    convenience init(){
        self.init(api: Api())
    }

    init(api: Api){
        self.api = api
    }

    func fetch(to action: @escaping () -> Void){
        api.showAccounts { accounts in
            self.accounts = accounts
            action()
        }
    }

    func delete(at index: Int, to action: @escaping () -> Void){
        api.deleteAccount(accounts[index]) { [unowned me = self] in
            me.accounts.remove(at: index)
            action()
        }
    }

    subscript(index: Int) -> Account {
        get {
            return Account.from(accounts[index])
        }
    }
}
