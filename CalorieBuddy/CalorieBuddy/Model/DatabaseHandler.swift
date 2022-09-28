//
//  DatabaseHandler.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/27.
//

import UIKit
import CoreData

class DatabaseHandler {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var user = [User]()
    
    func saveData() {
       
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func getUserInfo() -> [User] {
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.fetchLimit = 1
        
//        request.predicate = NSPredicate(format: "taskArchived == 0 && taskIsDone == 0")
        do {
            user = try context.fetch(request)
            return user
        } catch {
            print("Error fetching tasks: \(error)")
            return user
        }
    }
    
    func addUser(userName: String, userAge: String, userHeight: String, userWeight: String, userLimit: String) {
        
        let newUser = User(context: context)
        
        let ageInt = Int16(userAge)!
        let heightDouble = Double(userHeight)!
        let weightDouble = Double(userWeight)!
        let limitDouble = Double(userLimit)!

        newUser.userName = userName
        newUser.userAge = ageInt
        newUser.userHeight = heightDouble
        newUser.userWeight = weightDouble
        newUser.caloryLimit = limitDouble

        saveData()
        print("Saved successfully")
    }
    
    func editUser(userName: String?, userAge: String?, userHeight: String?, userWeight: String?, userLimit: String?) {
        
    }
}

