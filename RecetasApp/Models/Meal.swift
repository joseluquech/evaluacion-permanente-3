//
//  Meal.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import Foundation

struct MealWrapper: Decodable {
    let meals: [MealResponse]
}

struct MealResponse: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    func toMeal() -> Meal {
        Meal(id: self.idMeal, name: self.strMeal, thumb: self.strMealThumb)
    }
}

struct Meal: Identifiable {
    let id: String
    let name: String
    let thumb: String
}
