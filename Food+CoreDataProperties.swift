//
//  Food+CoreDataProperties.swift
//  
//
//  Created by 李書賢 on 2018/11/28.
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

}
