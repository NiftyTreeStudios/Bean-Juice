//
//  BJTabView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.3.2020.
//  Copyright © 2025 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

/// Contains the `TabView` and the tabs for the project.
struct BJTabView: View {

    @State private var selection = "Methods"

    @StateObject private var settings = SettingsViewModel.shared

    var body: some View {
        TabView(selection: $selection) {
            MethodSelectionView()
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
                .tag("Recipes")

            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag("Settings")
        }
        .environmentObject(settings)
        .accentColor(Color.accentColor)
    }
}
