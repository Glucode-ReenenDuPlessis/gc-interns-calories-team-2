//
//  FoodItemViewCell.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/30.
//

import UIKit

class FoodItemViewCell: UICollectionViewCell {
    var foodItem: FoodItem? {
        didSet{
            guard let unwrappedItem = foodItem else {return}
            titleText.text = unwrappedItem.foodName
            subText.text = unwrappedItem.category
        }
    }
    
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
    
    
    func setupLayout(){
        let bottomTextControner = UIView()
        bottomTextControner.translatesAutoresizingMaskIntoConstraints = false
    }
}
