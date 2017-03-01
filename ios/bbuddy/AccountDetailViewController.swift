//
//  AccountDetailViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 10/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var balanceField: UITextField!
    
    var account: Account! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI(){
        if nameField != nil {
            nameField.text = account.name
            balanceField.text = "\(account.balance)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func saveAccount(_ sender: UIButton) {
        if let name = nameField.text, let balance = Int(balanceField.text ?? ""){
            account.name = name
            account.balance = balance
            account.save {
                DispatchQueue.main.async { [unowned me = self] in
                    _ = me.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

}
