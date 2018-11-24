//
//  Beer+CoreDataProperties.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//
//

import Foundation
import CoreData


extension Beer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer")
    }

    @NSManaged public var beer_id: String?
    @NSManaged public var brewers_tips: String?
    @NSManaged public var contributed_by: String?
    @NSManaged public var desp: String?
    @NSManaged public var first_brewed: String?
    @NSManaged public var image_url: String?
    @NSManaged public var ingredient_id: String?
    @NSManaged public var name: String?
    @NSManaged public var tagline: String?

}
