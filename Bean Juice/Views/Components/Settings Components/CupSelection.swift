//
//  CupSelection.swift
//  CupSelection
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CupSelection: View {

    @EnvironmentObject var settings: SettingsViewModel

    var body: some View {

        Section(
            header: Text("Cup size")
                .font(.subheadline),
            footer: Text(
                "Picked size: "
                + "\(settings.selectedCupMlSize) ml. or "
                + "\(settings.selectedCupOzSize) oz.")
        ) {
            Picker(
                "Cup size",
                selection: Binding(
                    get: { settings.selectedCup },
                    set: { newValue in
                        settings.selectedCup = newValue
                        settings.cupSize = Double(settings.cupSizes[newValue].sizeMl)
                    }
                )
            ) {
                    ForEach(0 ..< settings.cupSizes.count, id: \.self) {
                        Text(settings.cupSizes[$0].name)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

            // if custom is selected a textfield is presented
            if $settings.selectedCup.wrappedValue == 4 {
                Picker("Custom cup size", selection: $settings.customCupSize) {
                    ForEach(0 ..< 1001) { number in
                        if number >= 100 && (number % 5) == 0 {
                            Text("\(number)")
                        }
                    }
                }
            }
        }
        .onChange(of: settings.customCupSize, perform: { value in
            settings.cupSizes[4].sizeMl = Int(value)
            settings.cupSize = Double(value)
        })
    }
}

struct CupSelection_Previews: PreviewProvider {
    static var previews: some View {
        CupSelection()
    }
}
