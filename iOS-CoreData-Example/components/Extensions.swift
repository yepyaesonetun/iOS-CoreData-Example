//
//  Extensions.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    var managedObjectContext: NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
