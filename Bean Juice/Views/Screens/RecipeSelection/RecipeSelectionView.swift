//
//  RecipeSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeSelectionView: View {

    @State var recipes: [Recipe] = []

    @State private var addButtonClicked: Bool = false

    var body: some View {
        NavigationView {
            if recipes.isEmpty {
                NoRecipesPlaceholder(addButtonClicked: $addButtonClicked)
            } else {
                List {
                    ForEach(recipes, id: \.name) { recipe in
                        RecipeCell(recipe: recipe)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Recipes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Button tapped")
                            addButtonClicked.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }
        }
        .sheet(isPresented: $addButtonClicked) {
            NewRecipeView(recipes: $recipes, addButtonClicked: $addButtonClicked)
        }
        .onAppear {
            recipes = loadRecipesFromUserDefaults()
        }
    }
}

struct NoRecipesPlaceholder: View {

    @Binding var addButtonClicked: Bool

    var body: some View {
        Text("There are no recipes! \n Add one from the top right corner")
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .navigationBarTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Button tapped")
                        addButtonClicked.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
    }
}

struct RecipeCell: View {

    let recipe: Recipe

    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            HStack {
                Image(getMethodName(method: recipe.brewMethod))
                Text(recipe.name)
            }
        }
    }
}
