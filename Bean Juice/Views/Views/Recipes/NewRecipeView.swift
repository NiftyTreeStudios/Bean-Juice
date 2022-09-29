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

    @Binding var recipes: [Recipe]
    @Binding var addButtonClicked: Bool

    @State private var name: String = ""
    @State private var brewMethod: MethodName = MethodName.custom
    @State private var groundSize: String = ""
    @State private var coffeeAmount: String = ""
    @State private var waterAmount: String = ""
    @State private var additionalInformation: String = ""

    @State private var minuteSelection: Int = 0
    @State private var secondSelection: Int = 0

    @State private var textEditorPlaceholder: String = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Recipe name", text: $name)
                Picker("Brew method", selection: $brewMethod) {
                    ForEach(MethodName.allCases) { method in
                        Text(getMethodName(method: method))
                    }
                }
                TextField("Ground size", text: $groundSize)
                TextField("Coffee amount", text: $coffeeAmount)
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
                Picker("Minutes", selection: $minuteSelection) {
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
                    TextEditor(text: $additionalInformation)
                        .frame(minHeight: 200, maxHeight: 200, alignment: .topLeading)
                        .padding(EdgeInsets(top: -7, leading: -4, bottom: -7, trailing: -4))
                    if additionalInformation.isEmpty {
                        TextField("Additional information", text: $textEditorPlaceholder)
                            .disabled(true)
                    }
                }

                SaveButton(
                    recipe: Recipe(
                        name: name,
                        brewMethod: brewMethod,
                        groundSize: groundSize,
                        coffeeAmount: Double(coffeeAmount) ?? 0,
                        waterAmount: Int(waterAmount) ?? 0,
                        brewTime: convertToSeconds(minutes: minuteSelection, seconds: secondSelection),
                        additionalInformation: additionalInformation
                    ),
                    recipes: $recipes,
                    addButtonClicked: $addButtonClicked
                )

            }
        }
        .navigationBarTitle("Add new recipe")
    }
}

struct SaveButton: View {

    let recipe: Recipe
    @Binding var recipes: [Recipe]
    @Binding var addButtonClicked: Bool

    var body: some View {
        Button {
            recipes = addNewRecipe(recipe: recipe, in: recipes)
            saveRecipesToUserDefaults(recipes)
            addButtonClicked.toggle()
        } label: {
            Text("Save recipe")
        }
    }
}
