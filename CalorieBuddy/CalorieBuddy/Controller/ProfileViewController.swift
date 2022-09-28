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
        
        
        
        if let userName = name.text, let userAge = age.text, let userHeight = height.text, let userWeight = weight.text, let userLimit = limit.text {
            
            dbh.addUser(userName: userName, userAge: userAge, userHeight: userHeight, userWeight: userWeight, userLimit: userLimit)
        }
        
    }

}
