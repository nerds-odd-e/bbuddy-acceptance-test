//
//  BudgetDetailViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit

class BudgetDetailViewController: UIViewController {
    
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    var budget: Budget!
    
    @IBAction func saveBudget(_ sender: UIButton) {
        if let month = monthField.text, let amount = Int(amountField.text ?? ""){
            budget.month = month
            budget.amount = amount
            budget.save {
                DispatchQueue.main.async { [unowned me = self] in
                    _ = me.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

}
