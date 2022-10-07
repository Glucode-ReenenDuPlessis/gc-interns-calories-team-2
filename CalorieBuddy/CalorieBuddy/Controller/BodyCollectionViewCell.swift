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
        foodView.backgroundColor = .cyan
    }
    
    func setUpContent(title: String, subTitle: String) {
        
        titleLable.text = title
        subTitleLable.text = subTitle
    }
}
