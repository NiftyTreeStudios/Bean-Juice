//
//  HighlightColorSelection.swift
//  HighlightColorSelection
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct HighlightColorSelection: View {

    @EnvironmentObject var settings: SettingsViewModel

    var body: some View {

        Section(
            header: Text("Select highlight color")
                    .font(.subheadline),
            footer: Text("This will affect what highlight color the app uses.")
        ) {
            Picker("Color", selection: $settings.colorIndex) {
                ForEach(0 ..< settings.colors.count, id: \.self) { color in
                    Text(settings.colors[color].name)
                        .tag(color)
                }
            }
        }
    }
}
