//
//  DataProvider.swift
//  SampleAPICall
//
//  Created by Sibusiso Mbonani on 2022/09/20.
//

import Foundation
import UIKit
import CoreData

class DataProvider {
    var foods: Food? = nil
    var foodRecipe: FoodRecipe? = nil
    
//    var foodSearchText:
    
    let userText: String = "chicken"
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [FoodItem]()
    
    func getAllItems(){
        let request:NSFetchRequest<FoodItem> = FoodItem.fetchRequest()
        
       
        do{
            models = try context.fetch(request)
            
        }catch{
            print("Error fetching data")
        }
        
    }
    
    
    
    func parseJSON(getFood:String, completion: @escaping () -> ()) {
        
       
        let trimmedUrl = getFood.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=08d4abd4&app_key=8be115386e91a9178c6728febb68d327&nutrition-type=cooking&ingr=\(trimmedUrl)")
        
        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            
            if error == nil {
                do {
                    self.foods = try JSONDecoder().decode(Food.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }.resume()
    }
    
    func parseSearchJSON(getFood:String, completion: @escaping () -> ()) {
        
       
        let trimmedUrl = getFood.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=bdad30ce&app_key=acc65bec841891df4ae486e1bdd50cdf&q=\(trimmedUrl)")
        
        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            
            if error == nil {
                do {
                    self.foodRecipe = try JSONDecoder().decode(FoodRecipe.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }.resume()
    }
    
    func AdvancedJson(getType: String,getFood:String, getDiet:String,getHealth:String,getMealType:String,completion: @escaping () -> ()) {
        
       
        let trimmedUrl = getFood.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=08d4abd4&app_key=8be115386e91a9178c6728febb68d327&nutrition-type=\(getType)&ingr=c&Diet=\(getDiet)&Health=\(getHealth)&mealType=\(getMealType)&cuisineType=all")
        
        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            
            if error == nil {
                do {
                    self.foods = try JSONDecoder().decode(Food.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }.resume()
    }
}
