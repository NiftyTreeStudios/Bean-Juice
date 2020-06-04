//
//  ItemRowView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    var item: Method
    
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
        NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: item.name, maxCups: Double(item.cupAmount), maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, customColor: self.$customColor)) {
            HStack {
                Image(item.name)
                Text(item.name)
            }
        }
    }
}

//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRowView(item: Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13), cupSize: self.$cupSize, ratio: 13, cups: 2)
//    }
//}
