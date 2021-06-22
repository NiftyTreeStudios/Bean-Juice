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
        Method(name: .aeropress, waterAmount: 230, grounds: "Medium/Fine", startRatio: 13),
        Method(name: .chemex, waterAmount: 1180, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: .coldBrew, waterAmount: 1000, grounds: "Coarse", startRatio: 15),
        Method(name: .dripMachine, waterAmount: 1000, grounds: "Medium", startRatio: 16),
        Method(name: .v60, waterAmount: 1000, grounds: "Medium", startRatio: 17)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(brewMethods, id: \.name) { brewMethod in
                    ItemRowView(item: brewMethod, cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor, mlSelected: $mlSelected)
                }
                NavigationLink(destination: FrenchPressView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, customColor: self.$customColor)) {
                    HStack {
                        Image("French Press-Big")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipShape(Circle())
                        Text("French Press")
                    }
                }
            }
            .navigationBarTitle("Brewing methods")
        }
    }
}
