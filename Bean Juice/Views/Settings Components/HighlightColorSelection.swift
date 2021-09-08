//
//  HighlightColorSelection.swift
//  HighlightColorSelection
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct HighlightColorSelection: View {

    @State private var selectedColor: Int = 0
    @Binding var customColor: Color

    var colors = [
        CustomColor(name: "Blue", color: Color.blue),
        CustomColor(name: "Green", color: Color.green),
        CustomColor(name: "Orange", color: Color.orange),
        CustomColor(name: "Pink", color: Color.pink),
        CustomColor(name: "Purple", color: Color.purple),
        CustomColor(name: "Red", color: Color.red),
        CustomColor(name: "Yellow", color: Color.yellow)
    ]

    var body: some View {

        let colorSelection = Binding<Int>(get: {
            return self.selectedColor
        }, set: {
            self.selectedColor = $0
            self.customColor = self.colors[$0].color
        })

        Section(
            header: Text("Select highlight color")
                    .font(.subheadline),
            footer: Text("This will affect what highlight color the app uses.")
        ) {
            Picker("Color", selection: colorSelection) {
                ForEach(0 ..< colors.count, id: \.self) { color in
                    Text(self.colors[color].name)
                        .tag(color)
                }
            }
        }
    }
}
