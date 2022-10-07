//
//  testingViewController.swift
//  CalorieBuddy
//
//  Created by Bronson van den Broeck on 2022/09/28.
//

import UIKit

class testingViewController: UIViewController {

    @IBOutlet weak var containerStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "testing"
        
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let homeComponent = Bundle.main.loadNibNamed("homeComponent", owner: self)?.first as? homeComponent else {
            return
        }
        homeComponent.translatesAutoresizingMaskIntoConstraints = false
        homeComponent.imageView 
        containerStackView.addArrangedSubview(homeComponent)
        
//        NSLayoutConstraint.activate([homeComponent.topAnchor.constraint(equalTo: containerView.topAnchor),
//                                     homeComponent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                                     homeComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                                     homeComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
//                                    ])
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
