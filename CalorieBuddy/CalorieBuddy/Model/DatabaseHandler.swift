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
    
    func editUser(userName: String, userAge: String, userHeight: String, userWeight: String, userLimit: String) {
        
//        if let name = userName, let age = userAge, let height = userHeight, let weight = userWeight, let limit = userLimit {

//            let editedData = getUserInfo()
//
//            for user in editedData {
//                if userName != nil {
//                    user.setValue(userName, forKey: "userName")
//                } else {
//                    user.setValue(user.userName, forKey: "userName")
//                }
//                let age = Int16(user.userAge)
                
//                let ageInt = Int16(userAge ?? <#default value#>)!
//                let heightDouble = Double(userHeight ?? <#default value#>)!
//                let weightDouble = Double(userWeight ?? <#default value#>)!
//                let limitDouble = Double(limit)!
                
//                print(user.userName ?? user.userName)
//                print(user.userAge)
//                print(user.userHeight)
//                print(user.userWeight)
//                print(user.caloryLimit)
//                user.setValue(ageInt, forKey: "userAge")
//                user.setValue(heightDouble, forKey: "userHeight")
//                user.setValue(weightDouble, forKey: "userWeight")
//                user.setValue(limitDouble, forKey: "caloryLimit")
//            }

//            saveData()
//            print("successfully edited")

//        } else {
//            print("Failed to save")
//        }
    }
}

