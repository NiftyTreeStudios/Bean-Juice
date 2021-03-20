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
    @State private var brewMethod: MethodName = MethodName.chemex
    @State private var groundSize: String = ""
    @State private var coffeeAmount: String = ""
    @State private var waterAmount: String = ""
    @State private var brewTime: String = ""
    @State private var additionalInformation: String = ""

    var body: some View {
        Form {
            TextField("Recipe name", text: $name)
            Picker("Brew method", selection: $brewMethod) {

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
            TextField("Brew time", text: $brewTime)
                .keyboardType(.numberPad)
                .onReceive(Just(waterAmount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.waterAmount = filtered
                                }
                }
            TextField("Additional information", text: $additionalInformation)

            Button {
                print("Saved recipe: \(name)")
                recipes = addNewRecipe(recipe: Recipe(
                                            name: name,
                                            brewMethod: brewMethod,
                                            groundSize: groundSize,
                                            coffeeAmount: coffeeAmount,
                                            waterAmount: Int(waterAmount) ?? 0,
                                            brewTime: Int(brewTime) ?? 0,
                                            additionalInformation: additionalInformation
                                      ), in: recipes)
                addButtonClicked.toggle()
            } label: {
                Text("Save recipe")
            }

        }
    }
}
