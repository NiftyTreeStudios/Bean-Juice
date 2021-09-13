//
//  RecipeSelectionViewModel.swift
//  RecipeSelectionViewModel
//
//  Created by Iiro Alhonen on 13.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

final class RecipeSelectionViewModel: ObservableObject {

    @State var recipes: [Recipe] = []

    /// Load recipes from user defaults and add them to the recipes state object.
    func loadRecipes() {
        recipes = loadRecipesFromUserDefaults()
    }

}
