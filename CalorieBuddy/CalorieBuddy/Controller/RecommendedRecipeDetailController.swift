//
//  RecommendedRecipeDetailController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/08.
//

import UIKit

class RecommendedRecipeDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var ingredientLabel: UILabel!
    
    var foodHit: Hit?
    var ingredients: [Ingredient]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredients = foodHit?.recipe.ingredients
        
        foodNameLabel.text = (foodHit?.recipe.label)!
        ingredientLabel.text = String(format: "%.2f Calories", (foodHit?.recipe.calories)!)
        
        foodImage.layer.masksToBounds = false
        foodImage.layer.cornerRadius = foodImage.frame.size.height / 15
        foodImage.clipsToBounds = true
        foodImage.loadImage(fromURL: (foodHit?.recipe.image)!)
        
        tableView.register(UINib(nibName: "RecommendationCell", bundle: nil), forCellReuseIdentifier: "RecommendationCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func testButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "recipeToAdd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.itemName.text = (foodHit?.recipe.label)!
            destination.itemsImageView.loadImage(fromURL: (foodHit?.recipe.image)!)
        }
    }
}

extension RecommendedRecipeDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ingredientItem = ingredients![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationCell") as! RecommendationCell
        cell.viewSetup()
        if ingredientItem.text == "Index 10" {
            cell.setUpCell(foodName: "Error Fetching Data", pic: "")
            return cell
        } else {
            cell.setUpCell(foodName: ingredientItem.text, pic: ingredientItem.image)
            return cell
        }
        return cell
    }
    
}
