//
//  NewRecipeView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import Combine

struct NewRecipeView: View {
    @Binding var recipe: Recipe
    @Binding var recipes: [Recipe]
    @Binding var addingRecipe: Bool

    @State private var waterAmount: String = "0"
    @State private var minuteSelection: Int = 0
    @State private var secondSelection: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Recipe name", text: $recipe.name)
                    Picker("Brew method", selection: $recipe.brewMethod) {
                        ForEach(MethodName.allCases) { method in
                            Text(getMethodName(method: method))
                        }
                    }
                    TextField("Ground size", text: $recipe.groundSize)
                    TextField("Coffee amount", text: $recipe.coffeeAmount)
                        .keyboardType(.decimalPad)
                    TextField("Water amount", text: $waterAmount)
                        .keyboardType(.numberPad)
                        .onReceive(Just(waterAmount)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.waterAmount = filtered
                            }
                        }
                    Text("Select brew time")
                    Picker("Minutes", selection:
                            $minuteSelection) {
                        ForEach(0..<11) {
                            Text("\($0)")
                        }
                    }
                    Picker("Seconds", selection: $secondSelection) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        TextEditor(text: $recipe.additionalInformation)
                            .frame(minHeight: 200, maxHeight: 200, alignment: .topLeading)
                            .padding(EdgeInsets(top: -7, leading: -4, bottom: -7, trailing: -4))
                    }
                }
                SaveButton(
                    recipe: $recipe,
                    recipes: $recipes,
                    addingRecipe: $addingRecipe
                )
            }
        }
        .navigationBarTitle("Add new recipe")
    }
}

struct SaveButton: View {
    @Binding var recipe: Recipe
    @Binding var recipes: [Recipe]
    @Binding var addingRecipe: Bool

    var body: some View {
        Button {
            var newRecipes: [Recipe] = []
            newRecipes = recipes
            if let index = recipes.firstIndex(where: { recipe.id == $0.id }) {
                print("☕️ Recipe that was edited: \(String(describing: recipe))")
                newRecipes[index] = recipe
            } else {
                print("☕️ Recipe that is being saved: \(String(describing: recipe))")
                newRecipes = addNewRecipe(recipe: recipe, in: recipes)
            }
            saveRecipesToUserDefaults(newRecipes)
            recipes = newRecipes
            addingRecipe = false
        } label: {
            Text("Save recipe")
        }
    }
}
