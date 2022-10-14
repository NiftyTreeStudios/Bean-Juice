//
//  NewRecipeView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import Combine

enum FormField {
    case name, groundSize, coffee, water, additionalInformation
}

struct NewRecipeView: View {
    @Binding var recipe: Recipe
    @Binding var recipes: [Recipe]
    @Binding var addingRecipe: Bool
    @FocusState var focusedField: FormField?

    @State private var waterAmount: String = ""
    @State private var minuteSelection: Int = 0
    @State private var secondSelection: Int = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("\(recipe.name.isEmpty ? "Add" : "Edit") recipe")
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                Form {
                    Section("Recipe name") {
                        TextField("Recipe name", text: $recipe.name)
                            .focused($focusedField, equals: .name)
                    }
                    Section("Brew method") {
                        Picker("Brew method", selection: $recipe.brewMethod) {
                            ForEach(MethodName.allCases) { method in
                                Text(getMethodName(method: method))
                            }
                        }
                    }
                    Section("Ground size") {
                        TextField("Ground size", text: $recipe.groundSize)
                            .focused($focusedField, equals: .groundSize)
                    }
                    Section("Coffee") {
                        TextField("Coffee amount", text: $recipe.coffeeAmount)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .coffee)
                    }
                    Section("Water") {
                        TextField("Water amount", text: $waterAmount)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: .water)
                            .onReceive(Just(waterAmount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.waterAmount = filtered
                                }
                            }
                    }
                    Section("Brew time") {
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
                    }
                    Section("Additional information") {
                        TextEditor(text: $recipe.additionalInformation)
                            .focused($focusedField, equals: .additionalInformation)
                            .frame(minHeight: 200, maxHeight: 200, alignment: .topLeading)
                    }
                }
                SaveButton(
                    recipe: $recipe,
                    waterAmount: waterAmount,
                    brewTime: convertToSeconds(minutes: minuteSelection, seconds: secondSelection),
                    recipes: $recipes,
                    addingRecipe: $addingRecipe
                ).disabled(
                    recipe.name.isEmpty
                    || recipe.groundSize.isEmpty
                    || recipe.coffeeAmount.isEmpty
                    || waterAmount.isEmpty
                )
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
        .navigationBarTitle("Add new recipe")
        .onAppear {
            if recipe.waterAmount > 0 {
                self.waterAmount = recipe.waterAmount.formatted()
            }
            self.minuteSelection = recipe.brewTime / 60
            self.secondSelection = recipe.brewTime % 60
        }
    }
}

struct SaveButton: View {
    @Binding var recipe: Recipe
    let waterAmount: String
    let brewTime: Int
    @Binding var recipes: [Recipe]
    @Binding var addingRecipe: Bool

    var body: some View {
        Button {
            recipe.waterAmount = Int(waterAmount) ?? 0
            recipe.brewTime = brewTime
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
        }.buttonStyle(.bordered)
    }
}
