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

    var body: some View {
        ScrollView {
            CircleImage(methodName: getMethodName(method: recipe.brewMethod), isRecipeView: true, brewTime: recipe.brewTime)
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(10)
                .multilineTextAlignment(.center)
            VStack {
                HStack {
                    Text("Ground level")
                        .font(.headline)
                    Spacer()
                    Text(recipe.groundSize)
                        .font(.subheadline)
                }
                .padding(.bottom, 5)

                HStack {
                    Text("Water")
                        .font(.title)
                    Spacer()
                    Text("\(recipe.waterAmount) g")
                        .font(.title)
                }
                .padding(.bottom, 5)

                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    Text(recipe.coffeeAmount + " g")
                        .font(.title)
                }
                .padding(.bottom, 5)

                if recipe.additionalInformation != nil {
                    HStack {
                        Text("Additional information")
                            .font(.headline)
                        Spacer()
                    }
                    Text(recipe.additionalInformation ?? "")
                        .frame(alignment: .leading)
                }
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 5)
        }
    }
}
