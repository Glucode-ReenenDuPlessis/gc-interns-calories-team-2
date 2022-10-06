//
//  User+CoreDataProperties.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/30.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var caloryLimit: Double
    @NSManaged public var idealUserWeight: Double
    @NSManaged public var userAge: Int16
    @NSManaged public var userGender: Bool
    @NSManaged public var userHeight: Double
    @NSManaged public var userName: String?
    @NSManaged public var userWeight: Double
    @NSManaged public var meals: NSSet?

}

// MARK: Generated accessors for meals
extension User {

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meal)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meal)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)

}

extension User : Identifiable {

}
