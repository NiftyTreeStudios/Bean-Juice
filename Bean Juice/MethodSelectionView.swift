//
//  MethodSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct MethodSelectionView: View {
    
    let brewMethods: [Method] = [
        Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13),
        Method(name: "Chemex", waterAmount: 1180, waterAmountOz: 40, cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: "V60", waterAmount: 1000, waterAmountOz: 33, cupAmount: 8, grounds: "Medium", startRatio: 17)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(brewMethods, id: \.name) { brewMethod in
                    ItemRowView(item: brewMethod)
                }
//                ForEach(brewMethods, id: \.name) { brewMethod in
//                    MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: brewMethod.name, maxCups: Double(brewMethod.cupAmount), maxWater: brewMethod.waterAmount, groundLevel: brewMethod.grounds)
//                            .tabItem {
//                            VStack {
//                                Image(brewMethod.name)
//                                Text(brewMethod.name)
//                            }
//                    }
//                    .onAppear {
//                        self.ratio = Double(brewMethod.startRatio)
//                        if (brewMethod.name == "Aeropress" && self.cups > 4) {
//                            self.cups = 4
//                        }
//                    }
//                }
            }
        .navigationBarTitle("Brewing methods")
        }
    }
}

struct MethodSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MethodSelectionView()
    }
}
