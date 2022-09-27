
//   let food = try? newJSONDecoder().decode(Food.self, from: jsonData)

import Foundation

// MARK: - Food
struct Food: Decodable {
    let text: String
    let parsed, hints: [Hint]
}

// MARK: - Hint
struct Hint: Codable {
    let food: FoodClass
}

// MARK: - FoodClass
struct FoodClass: Codable {
    let label, knownAs: String
    let nutrients: Nutrients
    let image: String?

//    enum CodingKeys: String, CodingKey {
//        case foodID = "foodId"
//        case label, knownAs, nutrients, category, categoryLabel, image
//    }
}

// MARK: - Nutrients
struct Nutrients: Codable {
    let ENERC_KCAL: Double
    let procnt, fat, chocdf, fibtg: Double?

//    enum CodingKeys: String, CodingKey {
//        case enercKcal = "ENERC_KCAL"
//        case procnt = "PROCNT"
//        case fat = "FAT"
//        case chocdf = "CHOCDF"
//        case fibtg = "FIBTG"
//    }
}
