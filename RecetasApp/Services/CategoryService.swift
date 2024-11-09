//
//  getCategories.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import Foundation

class CategoryService {
    private var url = "https://www.themealdb.com/api/json/v1/1/categories.php"
    
    func getAllCategories(completion: @escaping ( [Category]?, String? ) -> Void) {
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                do {
                    let wrapper = try JSONDecoder().decode(CategoryWrapper.self, from: data!)
                    let categoriesResponse = wrapper.categories
                    let categories = categoriesResponse.map { categoriesResponse in
                        categoriesResponse.toCategory()
                    }
                    completion(categories, nil)
                } catch (let error) {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message)
            }
        }
    }
}
