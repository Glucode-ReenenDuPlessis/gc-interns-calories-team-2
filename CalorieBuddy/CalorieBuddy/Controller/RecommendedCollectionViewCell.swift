//
//  RecommendedCollectionViewCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/29.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setUpView() {
        cellView.layer.cornerRadius = cellView.frame.size.height / 15
        cellView.backgroundColor = UIColor.cyan
        titleLabel.textColor = UIColor.white
    }
    
    func setUpContent(title: String, subTitle: String/*, image: String*/) {
        
        titleLabel.text = title
        subTitleLabel.text = "\(subTitle) reseps"
        //categoryImageView.loadImage(fromURL: image)
    }
    
}
