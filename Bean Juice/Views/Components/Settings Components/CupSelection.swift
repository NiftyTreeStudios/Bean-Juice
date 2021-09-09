//
//  CupSelection.swift
//  CupSelection
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CupSelection: View {

    @AppStorage(wrappedValue: 1, "selectedCup") var selectedCup: Int
    @AppStorage(wrappedValue: 150, "cupSize") var cupSize: Double
    @State var customCup = 0
    @State var cupSizes = [
        CupSize(name: "Small", sizeMl: 118),
        CupSize(name: "Medium", sizeMl: 177),
        CupSize(name: "Large", sizeMl: 236),
        CupSize(name: "X-Large", sizeMl: 355),
        CupSize(name: "Custom", sizeMl: 100)
    ]

    var body: some View {
        Section(header: Text("Cup size")
                    .font(.subheadline),
                footer: Text("Picked size: "  + "\(self.cupSizes[selectedCup].sizeMl) ml. or "  + "\(Double(self.cupSizes[selectedCup].sizeMl).convertMlToOz) oz.")) {
            Picker("Cup size", selection: Binding(get: {selectedCup}, set: { newValue in
                selectedCup = newValue
                cupSize = Double(cupSizes[newValue].sizeMl)})) {
                    ForEach(0 ..< cupSizes.count, id: \.self) {
                        Text(self.cupSizes[$0].name)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

            // if custom is selected a textfield is presented
            if $selectedCup.wrappedValue == 4 {
                Picker("Custom cup size", selection: $customCup) {
                    ForEach(0 ..< 1001) { number in
                        if number >= 100 && (number % 5) == 0 {
                            Text("\(number)")
                        }
                    }
                }
            }
        }.onChange(of: customCup, perform: { value in
            cupSizes[4].sizeMl = Int(value)
            cupSize = Double(value)
        })
    }
}

struct CupSelection_Previews: PreviewProvider {
    static var previews: some View {
        CupSelection()
    }
}
