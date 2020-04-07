//
//  ContentView.swift
//  Morning Brew
//
//  Created by Iiro Alhonen on 10.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var cupSize: Double = 177
 
    var body: some View {
        TabView(selection: $selection){
            MethodView(methodName: "Aeropress", maxCups: 4, cupSize: $cupSize, groundLevel: "Medium/Fine")
                .tabItem {
                    VStack {
                        Image("Aeropress")
                        Text("Aeropress")
                    }
                }
                .tag(0)
            MethodView(methodName: "Chemex", maxCups: 8, cupSize: $cupSize, groundLevel: "Medium/Fine")
                .tabItem {
                    VStack {
                        Image("Chemex")
                        Text("Chemex")
                    }
                }
                .tag(1)
            MethodView(methodName: "V60", maxCups: 8, cupSize: $cupSize, groundLevel: "Medium")
                .tabItem {
                    VStack {
                        Image("V60")
                        Text("V60")
                    }
                }
                .tag(2)
            SettingsView(cupSize: $cupSize)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
