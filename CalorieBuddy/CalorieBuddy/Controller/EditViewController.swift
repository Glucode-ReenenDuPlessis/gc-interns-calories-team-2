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
    
    var nameText = ""
    var weightText = ""
    var heightText = ""
    var idealWeightText = ""
    var limitText = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       editUser()
    }
    
    func editUser() {
        let user = dbh.getUserInfo()
        
        for user in user {
            name.text = user.userName
            age.text = String(user.userAge)
            height.text = String(user.userHeight)
            weight.text = String(user.userWeight)
            limit.text = String(user.caloryLimit)
            idealWeight.text = String(user.idealUserWeight)
        }
        
    }


    @IBAction func CalculatePressed(_ sender: UIButton) {
        dbh.editUser(userAge: age.text!, userHeight: height.text!, userWeight: weight.text!, userLimit: limit.text!)
        
      self.nameText = name.text!
      self.weightText = weight.text!
      self.heightText = height.text!
      self.idealWeightText = idealWeight.text!
      self.limitText = limit.text!
        
        performSegue(withIdentifier: "showDetail", sender: self)
    
        
        
        
        
        
        
        //   dbh.addUser(userName: "Sbu", userAge: "24", userHeight: "561", userWeight: "70", userLimit: "1566", idealWeight: "67", gender: true)
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
     vc.finalName = self.nameText
    vc.finalWeight = self.weightText
        vc.finalHeight = self.heightText
        vc.ID = self.idealWeightText
        vc.finalLimit = self.limitText
    
    
    }
    

}
