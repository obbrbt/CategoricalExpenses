//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by obbrbt on 9/30/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {

    convenience init?(name: String?, amount: Double, date: Date?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Expense.entity(), insertInto: context)
        
        self.name = name
        self.amount = amount
        self.date = date
    }
    
}
