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
        Method(name: .aeropress, maxWaterAmount: 230, mlPickerStep: 5, grounds: "Medium/Fine", startRatio: 13),
        Method(name: .chemex, maxWaterAmount: 1180, mlPickerStep: 10, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: .coldBrew, maxWaterAmount: 1000, mlPickerStep: 100, grounds: "Coarse", startRatio: 15),
        Method(name: .dripMachine, maxWaterAmount: 1500, mlPickerStep: 100, grounds: "Medium", startRatio: 16),
        Method(name: .frenchPress, maxWaterAmount: 1500, mlPickerStep: 10, grounds: "Coarse", startRatio: 18),
        Method(name: .v60, maxWaterAmount: 1000, mlPickerStep: 5, grounds: "Medium", startRatio: 17)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(brewMethods, id: \.name) { brewMethod in
                    ItemRowView(method: brewMethod, cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor, mlSelected: $mlSelected)
                }
            }
            .navigationBarTitle("Brewing methods")
        }
    }
}
