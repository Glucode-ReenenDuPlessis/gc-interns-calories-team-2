//
//  TabBarVC.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/10/05.
//

import UIKit
import SwiftUI

class TabBarVC: UIViewController {
    var tabBarCnt: UITabBarController = {
        let bar = UITabBarController()
        bar.tabBar.barStyle = .black
        bar.tabBar.barTintColor = .systemBackground
        bar.tabBar.tintColor = .label
        bar.tabBar.layer.cornerRadius = 50
        bar.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTabBarController()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

struct TabBarVC_Previews: PreviewProvider {
    static var previews: some View {
        Container().ignoresSafeArea()
    }
    
    struct Container: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> UIViewController {
            TabBarVC()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
        
        typealias UIViewControllerType = UIViewController
        
    }
}

extension TabBarVC{
    func createTabBarController(){
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        firstVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
    
        let secondVC =  StatsViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 1)
        
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        thirdVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        
        let controllerArray = [firstVC, secondVC,thirdVC]
        tabBarCnt.viewControllers = controllerArray.map{UINavigationController.init(rootViewController: $0)}
        self.view.addSubview(tabBarCnt.view)
        
  
    }
}
