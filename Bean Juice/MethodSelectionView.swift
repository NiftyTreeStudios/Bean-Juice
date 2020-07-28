//
//  MethodSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct MethodSelectionView: View {
    
    @Binding var cupSize: Double
    @Binding var ratio: Double
    @Binding var cups: Double
    @Binding var customColor: Color
    @Binding var mlSelected: Bool
    
    let brewMethods: [Method] = [
        Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, grounds: "Medium/Fine", startRatio: 13),
        Method(name: "Chemex", waterAmount: 1180, waterAmountOz: 40, grounds: "Medium/Coarse", startRatio: 17),
        // Method(name: "Custom", waterAmount: 1180, waterAmountOz: 40, grounds: "Medium", startRatio: 16),
        // Method(name: "French Press", waterAmount: 1500, waterAmountOz: 50, grounds: "Coarse", startRatio: 18),
        Method(name: "V60", waterAmount: 1000, waterAmountOz: 33, grounds: "Medium", startRatio: 17)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(brewMethods, id: \.name) { brewMethod in
                    ItemRowView(item: brewMethod, cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor, mlSelected: self.$mlSelected)
                }
                NavigationLink(destination: FrenchPressView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor)) {
                    HStack {
                        Image("French Press")
                        Text("French Press")
                    }
                }
                NavigationLink(destination: CustomView(customColor: self.$customColor)) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Custom")
                    }
                }
            }
            .navigationBarTitle("Brewing methods", displayMode: .inline)
        }
    }
}

//struct MethodSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        MethodSelectionView()
//    }
//}
