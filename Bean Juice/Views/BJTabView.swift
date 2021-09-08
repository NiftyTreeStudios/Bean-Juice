//
//  BJTabView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

/// Contains the ``TabView``.
struct BJTabView: View {
    @State private var selection = "Methods"
    @AppStorage(wrappedValue: false, "mlSelected") var mlSelected: Bool
    @AppStorage(wrappedValue: 150, "cupSize") var cupSize: Double

    @State private var customColor: Color = Color.blue

    var body: some View {
        TabView(selection: $selection) {
            MethodSelectionView(cupSize: $cupSize, customColor: self.$customColor, mlSelected: $mlSelected)
                .tabItem {
                    VStack {
                        Image(systemName: "ellipsis.circle")
                        Text("Methods")
                    }
                }
                .tag("Methods")

            RecipeSelectionView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Recipes")
                    }
                }

            SettingsView(mlSelected: $mlSelected, customColor: $customColor)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag("settings")
        }
        .accentColor(customColor)
    }
}
