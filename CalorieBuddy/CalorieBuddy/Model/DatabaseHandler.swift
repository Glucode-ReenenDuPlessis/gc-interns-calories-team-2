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
    
    func saveTasks() {
        do {
            try context.save()
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
    func saveData() {
       
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    
    func addUser(userName: String, userAge: String, userHeight: String, userWeight: String, userLimit: String) {
        
        let newUser = User(context: context)
        
        let ageInt = Int16(userAge)!
        let heightDouble = Double(userHeight)!
        let weightDouble = Double(userWeight)!
        let limitDouble = Double(userLimit)!
        
        print(ageInt)
        print(heightDouble)
//        newUser.userName = userName
//        newUser.userAge = ageInt
//        newUser.userHeight = heightDouble
//        newUser.userWeight = weightDouble
//        newUser.caloryLimit = limitDouble
//
//        saveData()
        print("Saved successfully")
    }
}

