//
//  Food_Pairing+CoreDataProperties.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//
//

import Foundation
import CoreData


extension Food_Pairing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food_Pairing> {
        return NSFetchRequest<Food_Pairing>(entityName: "Food_Pairing")
    }

    @NSManaged public var beer_id: Int32
    @NSManaged public var food_name: String?

}
