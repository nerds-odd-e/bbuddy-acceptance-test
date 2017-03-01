//
//  AccountTest.swift
//  bbuddy
//
//  Created by Jackson Zhang on 14/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import bbuddy

class AccountTest: QuickSpec {
    override func spec() {
        describe("Account"){
            it("add a new account if no id"){
                let accountDTO = DTO.Account(id: 0, name: "New", balance: 100)
                let api = MockApi()
                stub(api){ api in
                    when(api).addAccount(equal(to: accountDTO), to: anyClosure()).then { account, action in action() }
                }
                let account = Account(api: api)
                account.name = "New"
                account.balance = 100
                account.save() {}
                verify(api).addAccount(equal(to: accountDTO), to: anyClosure())
            }
            it("update the account if with id"){
                let accountDTO = DTO.Account(id: 1, name: "Existing", balance: 100)
                let api = MockApi()
                stub(api){ api in
                    when(api).addAccount(equal(to: accountDTO), to: anyClosure()).then { account, action in action() }
                    when(api).updateAccount(equal(to: accountDTO), to: anyClosure()).then { account, action in action() }
                }
                let account = Account(api: api)
                account.id = 1
                account.name = "Existing"
                account.balance = 100
                account.save() {}
                verify(api).updateAccount(equal(to: accountDTO), to: anyClosure())
            }
        }
    }
}

extension DTO.Account: Equatable{
    public static func ==(lhs: DTO.Account, rhs: DTO.Account) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.balance == rhs.balance
    }
}
