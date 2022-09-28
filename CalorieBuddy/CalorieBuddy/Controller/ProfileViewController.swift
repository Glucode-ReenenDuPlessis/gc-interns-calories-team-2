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
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addInfoPressed(_ sender: UIButton) {
        
//        let editedData = dbh.getUserInfo()
//        for user in editedData {
//            print(user.userName)
//            print(user.userAge)
//            print(user.userWeight)
//        }
        if let userName = name.text, let userAge = age.text, let userHeight = height.text, let userWeight = weight.text, let userLimit = limit.text {

            let editedData = dbh.getUserInfo()

            let ageInt = Int16(userAge)!
            let heightDouble = Double(userHeight)!
            let weightDouble = Double(userWeight)!
            let limitDouble = Double(userLimit)!

            for user in editedData {
                user.setValue(userName, forKey: "userName")
                user.setValue(ageInt, forKey: "userAge")
                user.setValue(heightDouble, forKey: "userHeight")
                user.setValue(weightDouble, forKey: "userWeight")
                user.setValue(limitDouble, forKey: "caloryLimit")
            }

            dbh.saveData()
            print("successfully edited")

        }
        
    }

}
