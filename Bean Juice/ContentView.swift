//
//  ContentView.swift
//  Morning Brew
//
//  Created by Iiro Alhonen on 10.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = "Aeropress"
    @State private var cupSize: Double = 177
    @State private var ratio: Double = 13
    @State private var cups: Double = 1
    
    let brewMethods: [Method] = [
        Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13),
        Method(name: "Chemex", waterAmount: 1180, waterAmountOz: 40, cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: "V60", waterAmount: 1000, waterAmountOz: 33, cupAmount: 8, grounds: "Medium", startRatio: 17)
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
                    }
                    .tag(brewMethod.name)
                    .onAppear {
                        self.ratio = Double(brewMethod.startRatio)
                        if (brewMethod.name == "Aeropress" && self.cups > 4) {
                            self.cups = 4
                        }
                    }
            }
            
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
