//
//  RecipeSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeSelectionView: View {

    @State var recipes: [Recipe] = [Recipe(name: "Test Aeropress recipe", brewMethod: MethodName.aeropress, groundSize: "Lrg", coffeeAmount: "12.3", waterAmount: 1234, brewTime: 150, additionalInformation: "This is additional information. This is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional information"), Recipe(name: "Test Chemex recipe", brewMethod: MethodName.chemex, groundSize: "Lrg", coffeeAmount: "12.3", waterAmount: 1234, brewTime: 150, additionalInformation: "This is additional information. This is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional information"), Recipe(name: "Test V60 recipe", brewMethod: MethodName.v60, groundSize: "Lrg", coffeeAmount: "12.3", waterAmount: 1234, brewTime: 150, additionalInformation: "This is additional information. This is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional informationThis is additional information")]

    @State private var addButtonClicked: Bool = false

    var body: some View {
        NavigationView {
            if recipes.isEmpty {
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
            } else {
                List {
                    ForEach(recipes, id: \.name) { recipe in
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            HStack {
                                Image(getMethodName(method: recipe.brewMethod))
                                Text(recipe.name)
                            }
                        }
                    }
                }.navigationBarTitle("Recipes")
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
    }
}
