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
 
    var body: some View {
        TabView(selection: $selection){
            ChemexView()
                .tabItem {
                    VStack {
                        Image("Chemex")
                        Text("Chemex")
                    }
                }
                .tag(0)
            Text("Aeropress")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("Aeropress")
                        Text("Aeropress")
                    }
                }
                .tag(1)
            Text("V60")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("V60")
                        Text("V60")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
