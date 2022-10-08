//
//  RecommendedRecipeDetailController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/08.
//

import UIKit

class RecommendedRecipeDetailController: UIViewController {
    
    var foodHit: Hit?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func testButtonPressed(_ sender: UIButton) {
        
        let ingredients = foodHit?.recipe.ingredients
        for ingredient in ingredients!  {
            print(ingredient)
        }
    }
    

}
