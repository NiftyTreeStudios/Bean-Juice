//
//  RecipeRowView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 03.02.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct RecipeRowView: View {
    var item: Recipe

    var body: some View {
        NavigationLink(
            destination: RecipeView(item: item),
            label: {
                Text(item.name)
            })
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(item: Recipe(name: "Test"))
    }
}
