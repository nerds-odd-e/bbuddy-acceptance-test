//
//  BudgetTest.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Cuckoo
@testable import bbuddy

class BudgetTest: QuickSpec {
    override func spec() {
        describe("Budget"){
            it("add a new account if no id"){
                let budgetDTO = DTO.Budget(id: 0, month: "2017-01", amount: 1000)
                let api = MockApi()
                stub(api){ api in
                    when(api).addBudget(equal(to: budgetDTO), to: anyClosure()).then { budget, action in action() }
                }
                let budget = Budget(api: api)
                budget.month = "2017-01"
                budget.amount = 1000
                budget.save() {}
                verify(api).addBudget(equal(to: budgetDTO), to: anyClosure())
            }
        }
    }
}

extension DTO.Budget: Equatable{
    public static func ==(lhs: DTO.Budget, rhs: DTO.Budget) -> Bool {
        return lhs.id == rhs.id && lhs.month == rhs.month && lhs.amount == rhs.amount
    }
}
