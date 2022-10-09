//
//  RecommendationCell.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/09.
//

import UIKit

class RecommendationCell: UITableViewCell {
    
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var foodTitle: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func viewSetup() {
//        backgroundImageView.contentMode = UIImageView.ContentMode.scaleAspectFit
        foodView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        foodView.layer.cornerRadius = foodView.frame.size.height / 10
        
        foodImageView.layer.cornerRadius = foodImageView.frame.size.height / 2
        foodImageView.clipsToBounds = true
    }
    
    func setUpCell(foodName:String, pic:String?) {
        foodTitle.text = foodName
        
        if pic != nil{
            //            foodImg.downloaded(from:pic!)
            foodImageView.loadImage(fromURL: pic!)
        } else{
            foodImageView.image = UIImage(named: "restaurant.png")
        }
    }
    
}
