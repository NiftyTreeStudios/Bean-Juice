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
    @State private var recipeBeingEdited: Recipe = Recipe(name: "", brewMethod: .custom, groundSize: "", coffeeAmount: 0, waterAmount: 0, brewTime: 0, additionalInformation: "")
    @State private var addingRecipe: Bool = false

    var body: some View {
        NavigationView {
            if recipes.isEmpty {
                NoRecipesPlaceholder(addButtonClicked: $addButtonClicked)
            } else {
                List {
                    ForEach(recipes, id: \.name) { recipe in
                        RecipeCell(recipe: recipe)
                            .swipeActions(edge: .leading) {
                                Button {
                                    print("Recipe given! \(recipe)")
                                    recipeBeingEdited = recipe
                                    addingRecipe = true
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.mint)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    if let index = recipes.firstIndex(of: recipe) {
                                        recipes.remove(at: index)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Recipes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            recipeBeingEdited = Recipe(
                                name: "", brewMethod: .custom, groundSize: "", coffeeAmount: 0, waterAmount: 0, brewTime: 0, additionalInformation: ""
                            )
                            addingRecipe = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
                .onChange(of: recipes) { newRecipes in
                    saveRecipesToUserDefaults(newRecipes)
                }
            }
        }
        .sheet(isPresented: $addingRecipe, content: {
            NewRecipeView(recipe: $recipeBeingEdited, recipes: $recipes, addingRecipe: $addingRecipe)
        })
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
                Image(getMethodName(method: recipe.brewMethod) + "-Big")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                Text(recipe.name)
                    .font(.title2)
            }
        }
    }
}
