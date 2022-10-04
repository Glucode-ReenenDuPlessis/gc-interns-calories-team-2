//
//  RecommendedCollectionViewCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/29.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var subTitleLable: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    func setUpView() {
        cellView.layer.cornerRadius = cellView.frame.size.height / 15
        cellView.backgroundColor = UIColor.cyan
        titleLable.textColor = UIColor.white
    }
    
    func setUpContent(title: String, subTitle: String/*, image: String*/) {
        
        titleLable.text = title
        subTitleLable.text = "\(subTitle) reseps"
        //categoryImageView.loadImage(fromURL: image)
    }
    
}
