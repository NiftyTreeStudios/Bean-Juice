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

        NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: getMethodName(method: item.name), maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, mlSelected: $mlSelected, customColor: self.$customColor)) {
                HStack {
                    Image(getMethodName(method: item.name))
                    Text(getMethodName(method: item.name))
                }
        }
    }
}
