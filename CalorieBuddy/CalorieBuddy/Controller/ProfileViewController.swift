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
    var finalLimit: Double = 0.0
    var userCaloryLimit = Double()
    var dailyAmount: Double = 800
    
    var users: [User] {
        let data = dbh.getUserInfo()
        return data
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.perform(#selector(setUpProgress), with: nil, afterDelay: 0.4)
        
//        nameLabel.text = finalName
//        weightLabel.text = finalWeight
//        heightLabel.text = finalHeight
//        idealWeightLabel.text = ID
//        limitLabel.text = finalLimit
        setUpView()
        setUpProgress()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        users = dbh.getUserInfo()
//    }
    
    func setUpView() {
        
        for user in users {
            userCaloryLimit = user.caloryLimit
            
            nameLabel.text = user.userName
            weightLabel.text = String(user.userWeight)
            heightLabel.text = String(user.userHeight)
            idealWeightLabel.text = String(user.idealUserWeight)
            limitLabel.text = String(user.caloryLimit)
            
        }
    }
    
//
//    @IBAction func addInfoPressed(_ sender: UIButton) {
//
//        //        dbh.addUser(userName: "OP", userAge: "25", userHeight: "120", userWeight: "67.7", userLimit: "1200", idealWeight: "60", gender: true)
//
//
//
//    }
    
//    @objc func setUpProgress(){
//        progressValue = progressValue + 0.01
//        self.dayProgress.progress = Float(progressValue)
//        if progressValue != 1.0 {
//           self.perform(#selector(setUpProgress), with: nil, afterDelay: 0.4)
//
//
//        }
//    }
    
    func setUpProgress() {
        let progressAmount = (dailyAmount / userCaloryLimit)
        let b = Float(progressAmount)
        print(b)
        dayProgress.progress = b
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
}
