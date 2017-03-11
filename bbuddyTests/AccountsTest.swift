//
// Created by Jackson Zhang on 11/03/2017.
// Copyright (c) 2017 odd-e. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import bbuddy

class AccountsTest: QuickSpec {
    override func spec() {
        describe("Accounts") {
            var api: MockApi!
            var accounts: Accounts!
            let dtoAccounts = [
                DTO.Account(id: 1, name: "Account 1", balance: 100),
                DTO.Account(id: 2, name: "Account 2", balance: 200),
                DTO.Account(id: 3, name: "Account 3", balance: 300),
                ]
            beforeEach {
                api = MockApi()
                stub(api){ api in
                    when(api).getAccounts(anyClosure()).then { action in action(dtoAccounts) }
                    when(api).deleteAccount(equal(to: dtoAccounts[1]), to: anyClosure()).then { account, action in action()}
                }
                accounts = Accounts(api: api)
            }
            it("count should be 0 when initialized") {
                expect(accounts.count) == 0
            }
            it("fetch accounts"){
                var called = false
                
                accounts.fetch { called = true }
                
                expect(accounts.count) == 3
                expect(accounts[0]) == Account.from(dtoAccounts[0])
                expect(accounts[1]) == Account.from(dtoAccounts[1])
                expect(accounts[2]) == Account.from(dtoAccounts[2])
                expect(called) == true
            }
            it("delete a account"){
                accounts.fetch {}
                var called = false
                
                accounts.delete(at: 1) { called = true }
                
                expect(accounts.count) == 2
                expect(accounts[0]) == Account.from(dtoAccounts[0])
                expect(accounts[1]) == Account.from(dtoAccounts[2])
                expect(called) == true
            }
        }
    }
}

extension Account: Equatable{
    public static func ==(lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.balance == rhs.balance
    }
}
