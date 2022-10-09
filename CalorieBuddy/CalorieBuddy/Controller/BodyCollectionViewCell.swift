//
//  BodyCollectionViewCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class BodyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var subTitleLable: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    
    
    func setUpView() {
        foodView.layer.cornerRadius = foodView.frame.size.height / 15
        foodView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    }
    
    func setUpContent(title: String, subTitle: String) {
        
        titleLable.text = title
        subTitleLable.text = subTitle
    }
}
