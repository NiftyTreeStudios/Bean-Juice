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
    @Binding var mlSelected: Bool
    
    var body: some View {

        NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: item.name, maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, mlSelected: self.$mlSelected, customColor: self.$customColor)) {
                HStack {
                    Image(item.name)
                    Text(item.name)
                }
        }
    }
}
