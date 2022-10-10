//
//  DetailViewController.swift
//  SampleAPICall
//
//  Created by Sthembiso Ndhlazi on 2022/09/26.
//

import UIKit

class DetailViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var itemsImageView: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    

   
    
    @IBOutlet weak var nutrientLabel1: UILabel!
    
   
    
    @IBOutlet weak var picker: UIPickerView!
    let dp = DataProvider()
    var selectedFood:Hint?
    var selectedRecipe: Hit?
    
    var pickerData = ["Breakfast","Lunch", "Supper"]
    var selectedCategory: String?
    
    var servings:Double?
    
    var calories:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedFood?.food.image != nil{
//           itemsImageView.downloaded(from:(selectedFood?.food.image!)!)
            itemsImageView.loadImage(fromURL: selectedFood?.food.image! ?? "")
        } else{
            itemsImageView.image = UIImage(named: "restaurant.png")
        }
       
        itemName.text = selectedFood?.food.label
        nutrientLabel1.text = "Calorie: \(selectedFood!.food.nutrients.ENERC_KCAL )"
       
        servings = 1
        servingsLabel.text = "\(servings!)"
        self.picker.delegate = self
        self.picker.dataSource = self
        
        itemsImageView.layer.borderWidth = 1
           itemsImageView.layer.masksToBounds = false
           itemsImageView.layer.borderColor = UIColor.black.cgColor
           itemsImageView.layer.cornerRadius = itemsImageView.frame.height/4
           itemsImageView.clipsToBounds = true
    }
    

    @IBAction func saveTapped(_ sender: Any) {
        print(selectedFood!.food.label)
        
        let taskName = selectedFood?.food.label
        calories = selectedFood!.food.nutrients.ENERC_KCAL * servings!
        
        let date = datePicker.date
        let category = selectedCategory
        
        let newItem = FoodItem(context: dp.context)
        
        newItem.foodName = taskName
        
        newItem.calorie = calories!
        newItem.imageString = selectedFood?.food.image
        
    
        newItem.date = date
        newItem.category = category
        do{
            try dp.context.save()
           print("Done saving...")
        }catch{
          print("error saving")
        }
        
        self.navigationController?.popToRootViewController( animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = pickerData[row]
    }
    
    
    
    @IBAction func minusTapped(_ sender: Any) {
        servings! -= 0.5
        servingsLabel.text = "\(servings!)"
        calories = selectedFood!.food.nutrients.ENERC_KCAL * servings!
        nutrientLabel1.text = "Calories: \(calories!)"
        
    }
    
    
    
    @IBAction func plusTapped(_ sender: Any) {
        servings! += 0.5
        servingsLabel.text = "\(servings!)"
        calories = selectedFood!.food.nutrients.ENERC_KCAL * servings!
        nutrientLabel1.text = "Calories: \(calories!)"
    }
}
