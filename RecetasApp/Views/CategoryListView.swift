//
//  CategoryListView.swift
//  RecetasApp
//
//  Created by Jose Luque on 08/11/2024.
//

import SwiftUI

struct CategoryListView: View {
    
    @State var categories: [Category] = []
    @State var message = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: MealsListView(category: category.name)) {
                        HStack {
                            Spacer()
                            ZStack {
                                AsyncImage(url: URL(string: category.thumb)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 200, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 8)
                                
                                Text(category.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .frame(width: 170, height: 30)
                                    .background(Color.gray.opacity(0.7))
                                    .clipShape(Capsule())
                                    .padding(.bottom, 10)
                                    .padding(.top, 120)
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                }
                if (!message.isEmpty) {
                    Text(message)
                }
            }
            .navigationTitle("Categories")
            .onAppear {
                CategoryService().getAllCategories { newCategories, newMessage in
                    guard let newCategories = newCategories else {
                        self.message = newMessage!
                        return
                    }
                    self.categories = newCategories
                }
            }
        }
    }
}

#Preview {
    CategoryListView()
}
