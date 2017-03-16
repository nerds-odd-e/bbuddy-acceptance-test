//
//  Budget.model.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import Foundation

class Budget{
    var id = 0
    var month = ""
    var amount = 0
    
    private var api: Api!
    
    convenience init(){
        self.init(api: Api())
    }
    
    init(api: Api){
        self.api = api
    }
    
    func save(_ action: @escaping () -> Void){
        let budgetToUpdate = DTO.Budget(id: id, month: month, amount: amount)
        api.addBudget(budgetToUpdate, to: action)
    }
}
