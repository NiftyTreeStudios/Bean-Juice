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
    @State private var cupSize: Double = 177
    @State private var ratio: Double = 13
    @State private var cups: Double = 1
 
    var body: some View {
        TabView(selection: $selection){
            MethodSelectionView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups)
                .tabItem {
                    VStack {
                        Image(systemName: "ellipsis.circle")
                        Text("Methods")
                    }
                }
                .tag("Methods")
            
            CustomView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Custom")
                    }
                }
                .tag("Custom")
            
            SettingsView(cupSize: $cupSize)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag("settings")
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
