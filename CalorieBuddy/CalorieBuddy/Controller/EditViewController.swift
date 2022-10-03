//
//  EditViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/28.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var heightViewContainer: UIView!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        addEditTextView()
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
    
    func addEditTextView() {
        let bundle = Bundle.main
        
        guard let heightView = bundle.loadNibNamed("EditTextFieldView", owner: self)?.first as? EditTextFieldView else {
            return
        }
        
        self.heightViewContainer.addSubview(heightView)
        heightView.pinEdges(to: self.heightViewContainer)
    }


    @IBAction func CalculatePressed(_ sender: UIButton) {
//        dbh.editUser(userAge: age.text!, userHeight: height.text!, userWeight: weight.text!, userLimit: limit.text!)
    }
    

}
