//
//  RecipeView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeView: View {

    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    init(oldRecipe: OldRecipe) {
        self.recipe = Recipe(from: oldRecipe)
    }

    var body: some View {
        ScrollView {
            CircleImage(methodName: getMethodName(method: recipe.brewMethod), isRecipeView: true, brewTime: recipe.brewTime ?? 0)
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(10)
                .multilineTextAlignment(.center)
            VStack(spacing: 8) {
                HStack {
                    Text("Ground level")
                        .font(.headline)
                    Spacer()
                    Text(recipe.groundSize ?? "No ground size provided")
                        .font(.subheadline)
                }

                HStack {
                    Text("Water")
                        .font(.title)
                    Spacer()
                    Text("\(recipe.waterAmount) g")
                        .font(.title)
                }

                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    Text("\(recipe.coffeeAmount, specifier: "%.1f") g")
                        .font(.title)
                }

                if recipe.additionalInformation != nil {
                    HStack {
                        Text("Additional information")
                            .font(.headline)
                        Spacer()
                    }
                    HStack {
                        Text(recipe.additionalInformation ?? "")
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 5)
        }
        .navigationTitle(recipe.name)
    }
}
