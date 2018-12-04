//
//  Food+CoreDataProperties.swift
//  
//
//  Created by 李書賢 on 2018/12/2.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var food1: String?
    @NSManaged public var food2: String?
    @NSManaged public var food3: String?
    @NSManaged public var food4: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var table: String?
    @NSManaged public var local: String?
    @NSManaged public var menu: String?
    @NSManaged public var many: Int16

}
