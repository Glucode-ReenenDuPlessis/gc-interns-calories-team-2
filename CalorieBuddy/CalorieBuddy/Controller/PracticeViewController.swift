//
//  PracticeViewController.swift
//  CalorieBuddy
//
//  Created by Tshegofatso Tlhomelang on 2022/09/29.
//

import UIKit

class PracticeViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var limit: UITextField!
    
    @IBOutlet weak var idealWeight: UITextField!
    
    let dbh = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
