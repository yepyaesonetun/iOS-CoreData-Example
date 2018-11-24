//
//  Hops+CoreDataProperties.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//
//

import Foundation
import CoreData


extension Hops {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hops> {
        return NSFetchRequest<Hops>(entityName: "Hops")
    }

    @NSManaged public var add: String?
    @NSManaged public var amount_unit: String?
    @NSManaged public var amount_value: String?
    @NSManaged public var attribute: String?
    @NSManaged public var ingredient_id: String?
    @NSManaged public var name: String?

}
