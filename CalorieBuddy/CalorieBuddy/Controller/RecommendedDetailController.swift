//
//  RecommendedDetailController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/07.
//

import UIKit

class RecommendedDetailController: UITableViewController {
    
    let dp = DataProvider()
    var categoryTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "foodItemCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        dp.parseSearchJSON(getFood: categoryTitle!) { [self] in
            if let foodArray = dp.foodRecipe {
                for foodHit in foodArray.hits {
                    
                    tableView.reloadData()
                }
            }
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dp.foodRecipe?.hits.count ?? 0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryTitle
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = dp.foodRecipe?.hits[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodItemCell") as! FoodItemCell
    
        cell.setUpCell(foodName: (food?.recipe.label)!, pic: food?.recipe.image, calory: food?.recipe.calories ?? 0, serving: "serving")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "recipeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecommendedRecipeDetailController {
            destination.foodHit = dp.foodRecipe?.hits[tableView.indexPathForSelectedRow!.row]
        }
        
    }

}
