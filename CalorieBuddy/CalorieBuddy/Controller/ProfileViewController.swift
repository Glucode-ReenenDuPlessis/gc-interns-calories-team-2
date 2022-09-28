//
//  ProfileViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/27.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var limit: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addInfoPressed(_ sender: UIButton) {
        
        let newUser = User(context: context)
        
        if let userName = name.text, let userAge = age.text, let userHeight = height.text, let userWeight = weight.text, let userLimit = limit.text {
            
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
        
    }
    
    func saveData() {
       
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    

}
