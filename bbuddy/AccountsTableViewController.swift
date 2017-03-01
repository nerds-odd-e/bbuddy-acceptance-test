//
//  AccountsTableViewController.swift
//  bbuddy
//
//  Created by Jackson Zhang on 08/02/2017.
//  Copyright © 2017 odd-e. All rights reserved.
//

import UIKit

class AccountsTableViewController: UITableViewController {
    
    private var accounts = Accounts() {
        didSet{
            tableView.reloadData()
        }
    }
    
    private func fetchAccounts(){
        accounts.fetch(to: refresh)
    }

    private func refresh(){
        DispatchQueue.main.async { [unowned me = self] in
            me.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAccounts()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return accounts.count
    }
    
    private struct Storyboard{
        static let AccountCellIdentifier = "Account"
        static let AddAccountSegue = "AddAccount"
        static let EditAccountSegue = "EditAccount"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.AccountCellIdentifier, for: indexPath)

        let account = accounts[indexPath.row]
        cell.textLabel?.text = account.name
        cell.detailTextLabel?.text = "\(account.balance)"

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            accounts.delete(at: indexPath.row, to: refresh)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        if let accountDetailViewController = destinationViewController as? AccountDetailViewController {
            if segue.identifier == Storyboard.AddAccountSegue {
                accountDetailViewController.account = Account()
            } else if segue.identifier == Storyboard.EditAccountSegue {
                if let accountIndex = tableView.indexPathForSelectedRow?.row {
                    accountDetailViewController.account = accounts[accountIndex]
                }
            }
        }
    }

}
