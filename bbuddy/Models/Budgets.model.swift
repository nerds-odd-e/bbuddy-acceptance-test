//
//  Budgets.model.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation

class Budgets{

    private var budgets = Array<DTO.Budget>()
    private var api: Api!

    convenience init(){
        self.init(api: Api())
    }

    init(api: Api){
        self.api = api
    }
    
    var count: Int{
        return budgets.count
    }

    func fetch(to action: @escaping () -> Void){
        api.getBudgets { [unowned me = self]budgets in
            me.budgets = budgets
            action()
        }
    }

    subscript(index: Int) -> Budget {
        return Budget.from(budgets[index])
    }
}

