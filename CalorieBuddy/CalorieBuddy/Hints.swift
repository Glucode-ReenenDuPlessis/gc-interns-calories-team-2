////
////  Hint.swift
////  SampleAPICall
////
////  Created by Sibusiso Mbonani on 2022/09/20.
////
//
//import Foundation
//
//// MARK: - Hints
//struct Hints: Codable {
//    let text: String
//    let parsed: [Parsed]
//}
//
//// MARK: - Parsed
//struct Parsed: Codable {
//    let food: [Food]
//}
//
//// MARK: - Food
//struct Food: Codable {
//    let foodID, label, knownAs: String
//    let nutrients: Nutrients
//    let category, categoryLabel: String
//    let image: String
//
//    enum CodingKeys: String, CodingKey {
//        case foodID = "foodId"
//        case label, knownAs, nutrients, category, categoryLabel, image
//    }
//}
//
//// MARK: - Nutrients
//struct Nutrients: Codable {
//    let enercKcal: Int
//    let procnt, fat, chocdf, fibtg: Double
//
//    enum CodingKeys: String, CodingKey {
//        case enercKcal = "ENERC_KCAL"
//        case procnt = "PROCNT"
//        case fat = "FAT"
//        case chocdf = "CHOCDF"
//        case fibtg = "FIBTG"
//    }
//}
