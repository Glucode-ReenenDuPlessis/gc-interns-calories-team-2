//
//  BodyCollectionViewCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class BodyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodView: UIView!
 
    func setUpContent() {
        foodView.layer.cornerRadius = foodView.frame.size.height / 15
        foodView.backgroundColor = .cyan

    }
}
