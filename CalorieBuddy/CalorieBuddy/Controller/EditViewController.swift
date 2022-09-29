//
//  EditViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/28.
//

import UIKit

class EditViewController: UIViewController {
    
    let dbh = DatabaseHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        printUser()
        
    }
    
    func printUser() {
        let user = dbh.getUserInfo()
        for eachUser in user {
            print(eachUser.userName)
            print(eachUser.userHeight)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
