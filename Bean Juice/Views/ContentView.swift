//
//  ContentView.swift
//  Morning Brew
//
//  Created by Iiro Alhonen on 10.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = "Methods"
    @AppStorage(wrappedValue: 150, "cupSize") var cupSize: Double
    @AppStorage(wrappedValue: false, "mlSelected") var mlSelected: Bool
    @State private var ratio: Double = 13
    @State private var cups: Double = 1

    @State private var customColor: Color = Color.blue

    var body: some View {
        TabView(selection: $selection) {
            MethodSelectionView(cupSize: $cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor, mlSelected: $mlSelected)
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

            SettingsView(mlSelected: $mlSelected, cupSize: $cupSize, customColor: $customColor)
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
