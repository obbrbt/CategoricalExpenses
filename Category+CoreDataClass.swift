//
//  Category+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by obbrbt on 9/30/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {

    var expensesArray: [Expense]? {
        return self.expenses?.array as? [Expense]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Category.entity(), insertInto: context)
        
        self.title = title
    }
    
}
