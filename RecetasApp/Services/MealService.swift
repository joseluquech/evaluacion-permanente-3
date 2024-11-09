//
//  MealService.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import Foundation

class MealService {
    
    func getAllMeals(for category: String, completion: @escaping ([Meal]?, String?) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                do {
                    let wrapper = try JSONDecoder().decode(MealWrapper.self, from: data!)
                    let meals = wrapper.meals.map { $0.toMeal() }
                    completion(meals, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message)
            }
        }
    }
}
