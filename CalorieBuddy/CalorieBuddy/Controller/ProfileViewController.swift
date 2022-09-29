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
        
       // dbh.addUser(userName: "Sbu", userAge: "27", userHeight: "170", userWeight: "90", userLimit: "1399", gender: true)
    }
    

    @IBAction func addInfoPressed(_ sender: UIButton) {

        dbh.addUser(userName: "OP", userAge: "25", userHeight: "120", userWeight: "67.7", userLimit: "1200", idealWeight: "60", gender: true)
        
    }

}
