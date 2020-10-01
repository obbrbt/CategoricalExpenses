//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Shawn Moore on 11/6/17.
//  Copyright © 2017 Shawn Moore. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var expensesTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewExpense(_ sender: Any) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
}

extension ExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        if let expense = category?.expenses?[indexPath.row] {
            cell.textLabel?.text = expense.name
            
            if let data = expense.date {
                cell.detailTextLabel?.text = dateFormatter.string(from: date)
            }
        }
        
        return cell
    }
}

extension ExpensesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
}


