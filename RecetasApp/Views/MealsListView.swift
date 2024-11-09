//
//  MealsListView.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import SwiftUI

import SwiftUI

struct MealsListView: View {
    
    let category: String
    @State private var meals: [Meal] = []
    @State var message = ""
    
    var body: some View {
        List {
            ForEach(meals) { meal in
                HStack {
                    AsyncImage(url: URL(string: meal.thumb)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 8)
                    
                    Text(meal.name)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            if (!message.isEmpty) {
                Text(message)
            }
        }
        .navigationTitle(category)
        .onAppear {
            MealService().getAllMeals(for: category) { newMeals, newMessage in
                guard let newMeals = newMeals else {
                    self.message = newMessage!
                    return
                }
                self.meals = newMeals
            }
        }
    }
}

#Preview {
    MealsListView(category: "Dessert")
}
