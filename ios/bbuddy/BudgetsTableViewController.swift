//
//  BudgetsTableViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 16/03/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit

class BudgetsTableViewController: UITableViewController {

    private var budgets = Budgets()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBudgets()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    private func fetchBudgets() {
        budgets.fetch(to: refresh)
    }

    private func refresh(){
        DispatchQueue.main.async { [unowned me = self] in
            me.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return budgets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Budget", for: indexPath)

        let budget = budgets[indexPath.row]
        cell.textLabel?.text = budget.month
        cell.detailTextLabel?.text = "\(budget.amount)"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let budgetDetailViewController = segue.destination as? BudgetDetailViewController {
            if segue.identifier == "AddBudget" {
                budgetDetailViewController.budget = Budget()
            }
        }
    }
    

}
