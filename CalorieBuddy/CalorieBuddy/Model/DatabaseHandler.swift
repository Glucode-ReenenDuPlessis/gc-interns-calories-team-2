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
    
    func addUser(userName: String, userAge: String, userHeight: String, userWeight: String, userLimit: String, idealWeight: String, gender: Bool) {
        
        let newUser = User(context: context)
        
        let ageInt = Int16(userAge)!
        let heightDouble = Double(userHeight)!
        let weightDouble = Double(userWeight)!
        let limitDouble = Double(userLimit)!
        let idealWeightDouble = Double(idealWeight)!

        newUser.userName = userName
        newUser.userAge = ageInt
        newUser.userHeight = heightDouble
        newUser.userWeight = weightDouble
        newUser.caloryLimit = limitDouble
        newUser.idealUserWeight = idealWeightDouble
        newUser.userGender = gender

        saveData()
        print("Saved successfully")
    }
    
    func editUser(userAge: String, userHeight: String, userWeight: String, userLimit: String) {
            let editedData = getUserInfo()

            for user in editedData {

                let ageInt = Int16(userAge)!
                let heightDouble = Double(userHeight)!
                let weightDouble = Double(userWeight)!
                let limitDouble = Double(userLimit)!
                
                user.setValue(ageInt, forKey: "userAge")
                user.setValue(heightDouble, forKey: "userHeight")
                user.setValue(weightDouble, forKey: "userWeight")
                user.setValue(limitDouble, forKey: "caloryLimit")
            }

            saveData()
            print("successfully edited")

    }
}

