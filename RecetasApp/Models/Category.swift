//
//  Category.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import Foundation

struct CategoryWrapper: Decodable {
    let categories: [CategoryResponse]
}

struct CategoryResponse: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    func toCategory() -> Category {
        Category(id: self.idCategory, name: self.strCategory, thumb: self.strCategoryThumb)
    }
}

struct Category: Identifiable {
    let id: String
    let name: String
    let thumb: String
}
