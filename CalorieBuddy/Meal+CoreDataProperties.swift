//
//  Meal+CoreDataProperties.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/30.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var mealCalory: Double
    @NSManaged public var mealName: String?
    @NSManaged public var users: User?

}

extension Meal : Identifiable {

}
