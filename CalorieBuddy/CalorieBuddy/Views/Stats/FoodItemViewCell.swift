//
//  FoodItemViewCell.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/30.
//

import UIKit

class FoodItemViewCell: UICollectionViewCell {
    
    var titleText: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var subText: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .random()
        layer.cornerRadius = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
