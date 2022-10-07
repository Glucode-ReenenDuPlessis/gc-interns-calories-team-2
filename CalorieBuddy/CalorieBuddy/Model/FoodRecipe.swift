//
//  FoodRecipe.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/07.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct FoodRecipe: Codable {
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
}
// MARK: - Recipe
struct Recipe: Codable {
    let label: String
    let image: String
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType: [String]
    let mealType: [MealType]
    let dishType: [DishType]
}

enum DishType: String, Codable {
    case condimentsAndSauces = "condiments and sauces"
    case egg = "egg"
    case mainCourse = "main course"
    case salad = "salad"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let image: String
}

enum MealType: String, Codable {
    case lunchDinner = "lunch/dinner"
}
