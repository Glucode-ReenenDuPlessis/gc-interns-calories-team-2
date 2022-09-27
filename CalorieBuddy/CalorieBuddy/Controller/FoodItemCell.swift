//
//  FoodItemCell.swift
//  SampleAPICall
//
//  Created by Sibusiso Mbonani on 2022/09/27.
//

import UIKit

class FoodItemCell: UITableViewCell {
    
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodTitle: UILabel!
    
    @IBOutlet weak var foodCalory: UILabel!
    
    @IBOutlet weak var weightDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(foodName:String, pic:String?, calory: Double, serving: String) {
        foodTitle.text = foodName
        
        foodCalory.text = "Calories: \(calory)"
        
        if pic != nil{
            //            foodImg.downloaded(from:pic!)
            foodImageView.loadImage(fromURL: pic!)
        } else{
            foodImageView.image = UIImage(systemName: "questionmark")
        }
    }
    
    func viewSetup() {
//        backgroundImageView.contentMode = UIImageView.ContentMode.scaleAspectFit
        foodView.layer.cornerRadius = foodView.frame.size.height / 15
        
        foodImageView.layer.cornerRadius = foodImageView.frame.size.height / 2
        foodImageView.clipsToBounds = true
    }
}
