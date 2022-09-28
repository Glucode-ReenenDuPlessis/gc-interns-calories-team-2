//
//  DatabaseHandler.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/27.
//

import UIKit
import CoreData

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func saveTasks() {
    do {
        try context.save()
    } catch {
        print("Error saving task: \(error)")
    }
}
