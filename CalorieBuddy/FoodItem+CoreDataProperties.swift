//
//  FoodItem+CoreDataProperties.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/30.
//
//

import Foundation
import CoreData


extension FoodItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItem> {
        return NSFetchRequest<FoodItem>(entityName: "FoodItem")
    }

    @NSManaged public var calorie: Double
    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var foodName: String?
    @NSManaged public var imageString: String?

}

extension FoodItem : Identifiable {

}
