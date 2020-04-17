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
    @State private var ratio: Double = 13
    @State private var cups: Double = 1
    
    let brewMethods: [Method] = [
        Method(name: "Aeropress", waterAmount: 400, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13, tag: 0),
        Method(name: "Chemex", waterAmount: 1000, cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17, tag: 1),
        Method(name: "V60", waterAmount: 600, cupAmount: 8, grounds: "Medium", startRatio: 17, tag: 2)
    ]
 
    var body: some View {
        TabView(selection: $selection){
            ForEach(brewMethods, id: \.name) { brewMethod in
                MethodView(ratio: self.$ratio, cups: self.$cups, methodName: brewMethod.name, maxCups: Double(brewMethod.cupAmount), cupSize: self.$cupSize, maxWater: brewMethod.waterAmount, groundLevel: brewMethod.grounds)
                    .tabItem {
                        VStack {
                            Image(brewMethod.name)
                            Text(brewMethod.name)
                        }
                    }.onAppear {
                        self.ratio = Double(brewMethod.startRatio)
                    }
                .tag(brewMethod.tag)
            }
            
            SettingsView(cupSize: $cupSize)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(3)
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
