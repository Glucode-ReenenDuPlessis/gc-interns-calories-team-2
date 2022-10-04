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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var limit: UITextField!
    @IBOutlet weak var idealWeight: UITextField!
    
    let dbh = DatabaseHandler()
    
    var nameText = ""
    var weightText: UITextField?
    var heightText: UITextField?
    var limitText:UITextField?
    var ageText: UITextField?
    
    var users: [User] {
        let data = dbh.getUserInfo()
        return data
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       editUser()
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNumberField()
        addNumberField1()
        addNumberField2()
        addNumberField3()
    }
    
    func addNumberField() {
        let bundle = Bundle.main
        
        guard let heightView = bundle.loadNibNamed("EditNumberFieldView", owner: self)?.first as? EditNumberFieldView
                
        else {
            return
        }
        
        heightView.titleLabel.text = "Height"
        for user in users {
            heightView.userInputField.text = String(user.userHeight)
        }
        
        heightText = heightView.userInputField
        self.heightViewContainer.addSubview(heightView)
        heightView.pinEdges(to: self.heightViewContainer)
        
    }
    
    func addNumberField1() {
        let bundle = Bundle.main
        
        guard let weightView = bundle.loadNibNamed("EditNumberFieldView", owner: self)?.first as? EditNumberFieldView
        else {
            return
        }
        
        weightView.titleLabel.text = "Height"
        for user in users {
            weightView.userInputField.text = String(user.userWeight)
        }

        weightView.titleLabel.text = "Weight"
        weightText = weightView.userInputField
        self.weightViewContainer.addSubview(weightView)
        weightView.pinEdges(to: self.weightViewContainer)
    }
    
    func addNumberField2() {
        let bundle = Bundle.main
        
        guard let limitView = bundle.loadNibNamed("EditNumberFieldView", owner: self)?.first as? EditNumberFieldView
        else {
            return
        }
        
        limitView.titleLabel.text = "Height"
        for user in users {
            limitView.userInputField.text = String(user.caloryLimit)
        }
        
        limitView.titleLabel.text = "Limit"
        limitText = limitView.userInputField
        self.limitViewContainer.addSubview(limitView)
        limitView.pinEdges(to: self.limitViewContainer)
        
    }
    
    func addNumberField3() {
        let bundle = Bundle.main
        
        guard let ageView = bundle.loadNibNamed("EditNumberFieldView", owner: self)?.first as? EditNumberFieldView
        else {
            return
        }
        
        ageView.titleLabel.text = "Height"
        for user in users {
            ageView.userInputField.text = String(user.userAge)
        }
        
        ageView.titleLabel.text = "Age"
        ageText = ageView.userInputField
        self.ageViewContainer.addSubview(ageView)
        ageView.pinEdges(to: self.ageViewContainer)
        
    }

    
    func editUser() {
        let user = dbh.getUserInfo()
        
        for user in user {
            nameLabel.text = user.userName
        }
        
    }


    @IBAction func CalculatePressed(_ sender: UIButton) {
        
        print(heightText?.text ?? "No text")
        print(weightText?.text ?? "No text")
        print(limitText?.text ?? "No text")
        print(ageText?.text ?? "No text")
//        dbh.editUser(userAge: age.text!, userHeight: height.text!, userWeight: weight.text!, userLimit: limit.text!)
//
//      self.nameText = name.text!
//      self.weightText = weight.text!
//      self.heightText = height.text!
//      self.idealWeightText = idealWeight.text!
//      self.limitText = limit.text!
//
//        performSegue(withIdentifier: "showDetail", sender: self)
        
        
        
        
        
        
        //   dbh.addUser(userName: "Sbu", userAge: "24", userHeight: "561", userWeight: "70", userLimit: "1566", idealWeight: "67", gender: true)
        
       
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! ProfileViewController
//     vc.finalName = self.nameText
//    vc.finalWeight = self.weightText
//        vc.finalHeight = self.heightText
//        vc.ID = self.idealWeightText
//        vc.finalLimit = self.limitText
    
    
//    }
    

}
