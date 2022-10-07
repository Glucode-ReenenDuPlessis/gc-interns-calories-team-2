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
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var dayProgress: UIProgressView!
    
    @IBOutlet weak var weekProgress: UIProgressView!
    
    var progressValue = 0.0
    
    
    var finalName = ""
    var finalWeight = ""
    var finalHeight = ""
    var ID = ""
    var finalLimit: Double = 0.0
    var userCaloryLimit = Double()
    var dailyAmount: Double = 1000
    
    var users: [User] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = dbh.getUserInfo()
        setUpView()
        setUpProgress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        users = dbh.getUserInfo()
        setUpView()
    }
    
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
    
    func setUpProgress() {
        let progressAmount = (dailyAmount / userCaloryLimit)
        let b = Float(progressAmount)
        let percentage = b * 100
        let percentString = String(format: "You are %.1f", percentage)
        let continued = "% from reaching your limit"
        dayProgress.progress = b
        progressLabel.text = percentString + continued
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
}
