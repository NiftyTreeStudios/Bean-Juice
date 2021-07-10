//
//  CoffeeRatioSlider.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.07.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CoffeeRatioSlider: View {

    @Binding var ratio: Double
    @Binding var customColor: Color
    
    var body: some View {
        Text("Ratio")
            .font(.headline)
            .padding(.bottom, -5)
        Slider(value: $ratio, in: 8...20, step: 1)
            .accentColor(customColor)
        Text("1:\(Int(ratio))")
            .font(.subheadline)
            .padding(.bottom, 10)
            .padding(.top, 0)
    }
}
