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
        let attributedText = NSMutableAttributedString(string: "Title",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold)])
        text.attributedText = attributedText
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var subText: UILabel = {
        var text = UILabel()
        let attributedText = NSMutableAttributedString(string: "Sub texts",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular) ])
        text.attributedText = attributedText
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .random().withAlphaComponent(0.2)
        setupLayout()
        layer.cornerRadius = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout(){
        addSubview(titleText)
        addSubview(subText)
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            titleText.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            titleText.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            
            subText.topAnchor.constraint(equalTo: titleText.bottomAnchor),
            subText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subText.trailingAnchor.constraint(equalTo: trailingAnchor),
            subText.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20)
        ])
    }
}
