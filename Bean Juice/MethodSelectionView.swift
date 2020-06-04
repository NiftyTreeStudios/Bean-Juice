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
    
    let brewMethods: [Method] = [
        Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13),
        Method(name: "Chemex", waterAmount: 1180, waterAmountOz: 40, cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: "V60", waterAmount: 1000, waterAmountOz: 33, cupAmount: 8, grounds: "Medium", startRatio: 17)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(brewMethods, id: \.name) { brewMethod in
                    ItemRowView(item: brewMethod, cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor)
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
