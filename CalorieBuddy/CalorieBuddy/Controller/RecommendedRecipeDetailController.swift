//
//  RecommendedRecipeDetailController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/08.
//

import UIKit

class RecommendedRecipeDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var foodHit: Hit?
    var ingredients: [Ingredient]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredients = foodHit?.recipe.ingredients
        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "foodItemCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func testButtonPressed(_ sender: UIButton) {
        
//        let ingredients = foodHit?.recipe.ingredients
//        for ingredient in ingredients!  {
//            print("-------------------------")
//            print(ingredient.text)
//        }
    }
}

extension RecommendedRecipeDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ingredientItem = ingredients![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodItemCell") as! FoodItemCell
        cell.setUpCell(foodName: ingredientItem.text, pic: ingredientItem.image, calory: 0.0, serving: "")
        return cell
    }
    
}
