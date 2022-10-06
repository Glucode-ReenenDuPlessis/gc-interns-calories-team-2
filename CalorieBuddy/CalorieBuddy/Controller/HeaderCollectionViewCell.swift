//
//  HeaderCollectionViewCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleText: UILabel!
    
    func setUpView(_ item: ListItem) {
        titleView.layer.cornerRadius = titleView.frame.size.height / 10
        titleView.backgroundColor = .cyan
        
        titleText.text = item.title
    }
}
