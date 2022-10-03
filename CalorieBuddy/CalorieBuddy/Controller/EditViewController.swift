//
//  EditViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/28.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var heightViewContainer: UIView!
    @IBOutlet weak var weightViewContainer: UIView!
    @IBOutlet weak var limitViewContainer: UIView!
    @IBOutlet weak var ageViewContainer: UIView!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var limit: UITextField!
    @IBOutlet weak var idealWeight: UITextField!
    
    let dbh = DatabaseHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setUpView()
    }
    
    func setUpView() {
        let user = dbh.getUserInfo()
        
        for user in user {
            name.placeholder = user.userName
            age.text = String(user.userAge)
            height.text = String(user.userHeight)
            weight.text = String(user.userWeight)
            limit.text = String(user.caloryLimit)
            idealWeight.text = String(user.idealUserWeight)
        }
        
    }
    
    

    @IBAction func CalculatePressed(_ sender: UIButton) {
        print(age.text!)
//        dbh.editUser(userAge: age.text!, userHeight: height.text!, userWeight: weight.text!, userLimit: limit.text!)
    }
    

}
