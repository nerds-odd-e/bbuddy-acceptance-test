//
//  BudgetsTest.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import bbuddy

class BudgetsTest: QuickSpec {
    override func spec() {
        describe("Budgets") {
            var api: MockApi!
            var budgets: Budgets!
            let dtoBudgets = [
                DTO.Budget(id: 1, month: "Budget 1", amount: 100),
                DTO.Budget(id: 2, month: "Budget 2", amount: 200),
                DTO.Budget(id: 3, month: "Budget 3", amount: 300),
                ]
            beforeEach {
                api = MockApi()
                stub(api){ api in
                    when(api).getBudgets(anyClosure()).then { action in action(dtoBudgets) }
                }
                budgets = Budgets(api: api)
            }
            it("count should be 0 when initialized") {
                expect(budgets.count) == 0
            }
            it("fetch budgets"){
                var called = false

                budgets.fetch { called = true }

                expect(budgets.count) == 3
                expect(budgets[0]) == Budget.from(dtoBudgets[0])
                expect(budgets[1]) == Budget.from(dtoBudgets[1])
                expect(budgets[2]) == Budget.from(dtoBudgets[2])
                expect(called) == true
            }
        }
    }
}

extension Budget: Equatable{
    public static func ==(lhs: Budget, rhs: Budget) -> Bool {
        return lhs.id == rhs.id && lhs.month == rhs.month && lhs.amount == rhs.amount
    }
}
