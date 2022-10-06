//
//  TabBarStoryBoardVC.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/10/07.
//

import UIKit

class TabBarStoryBoardVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let secondVC =  StatsViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 3)
        let controllerArray = [secondVC]
        viewControllers?.append(secondVC)
        
        
    }
    
}
