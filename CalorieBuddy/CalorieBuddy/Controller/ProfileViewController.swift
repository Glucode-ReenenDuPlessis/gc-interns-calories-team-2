//
//  ProfileViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/27.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idealWeightLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    
    var finalName = ""
    var finalWeight = ""
    var finalHeight = ""
    var ID = ""
    var finalLimit = ""
    
    var users: [User] {
        let data = dbh.getUserInfo()
        return data
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameLabel.text = finalName
//        weightLabel.text = finalWeight
//        heightLabel.text = finalHeight
//        idealWeightLabel.text = ID
//        limitLabel.text = finalLimit
        setUpView()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        users = dbh.getUserInfo()
//    }
    
    func setUpView() {
        
        for user in users {
            nameLabel.text = user.userName
            weightLabel.text = String(user.userWeight)
            heightLabel.text = String(user.userHeight)
            idealWeightLabel.text = String(user.idealUserWeight)
            limitLabel.text = String(user.caloryLimit)
            
        }
    }
    

    @IBAction func addInfoPressed(_ sender: UIButton) {
       
        
    }

}
