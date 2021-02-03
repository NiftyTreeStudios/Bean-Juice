//
//  RecipeView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 03.02.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    var item: Recipe
    var body: some View {
        Text(item.name)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(item: Recipe(name: "Test recipe"))
    }
}
