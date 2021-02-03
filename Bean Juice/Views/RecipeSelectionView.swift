//
//  RecipeSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 03.02.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeSelectionView: View {
    var recipes: [Recipe] = []
    // @Published var recipes = UserDefaults.standard.array(forKey: "recipes") as? [Recipe] ?? []
    @State var addingNewRecipe: Bool = false

    var body: some View {
        NavigationView {
            Group {
                if recipes.isEmpty {
                    Text("No recipes found")
                } else {
                    List {
                        ForEach(recipes, id: \.name) { recipe in
                            RecipeRowView(item: recipe)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Custom recipes").bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Hello")
                        self.addingNewRecipe.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                    }).sheet(isPresented: $addingNewRecipe, content: {
                        RecipeCreation()
                    })
                }
            }
        }
    }
}

struct RecipeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSelectionView(recipes: [Recipe(name: "Test recipe")])
    }
}
