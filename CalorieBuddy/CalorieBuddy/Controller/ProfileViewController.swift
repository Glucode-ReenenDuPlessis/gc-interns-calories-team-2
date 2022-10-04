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
    
    @IBOutlet weak var dayProgress: UIProgressView!
    
    @IBOutlet weak var weekProgress: UIProgressView!
    
    var progressValue = 0.0
    
    
    var finalName = ""
    var finalWeight = ""
    var finalHeight = ""
    var ID = ""
    var finalLimit = ""
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.perform(#selector(setUpProgress), with: nil, afterDelay: 0.4)
        
        nameLabel.text = finalName
        weightLabel.text = finalWeight
        heightLabel.text = finalHeight
        idealWeightLabel.text = ID
        limitLabel.text = finalLimit
        

        // Do any additional setup after loading the view.
        
       // dbh.addUser(userName: "Sbu", userAge: "27", userHeight: "170", userWeight: "90", userLimit: "1399", gender: true)
    }
    
//
//    @IBAction func addInfoPressed(_ sender: UIButton) {
//
//        //        dbh.addUser(userName: "OP", userAge: "25", userHeight: "120", userWeight: "67.7", userLimit: "1200", idealWeight: "60", gender: true)
//
//
//
//    }
    
    @objc func setUpProgress(){
        progressValue = progressValue + 0.01
        self.dayProgress.progress = Float(progressValue)
        if progressValue != 1.0 {
           self.perform(#selector(setUpProgress), with: nil, afterDelay: 0.4)
            
            
        }
    }

}
