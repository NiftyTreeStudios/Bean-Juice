//
//  WaterAmountSlider.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.07.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct WaterAmountSlider: View {
    
    let method: Method
    
    @State var waterAmount: Double = 200
    @Binding var cups: Double
    @Binding var cupSize: Double
    @Binding var mlSelected: Bool
    @Binding var customColor: Color
    
    var maxCups: Double {
        if cupSize > Double(method.maxWaterAmount) {
            self.cupSize = Double(method.maxWaterAmount)
            return 1
        } else {
            return Double(method.maxWaterAmount) / cupSize
        }
    }
    
    var body: some View {
        Text(mlSelected ? "Water" : "Cups")
            .font(.headline)
            .padding(.bottom, -5)
        if mlSelected {
            Slider(value: $waterAmount, in: 0...Double(method.maxWaterAmount), step: method.mlPickerStep)
                .accentColor(customColor)
        } else {
            Slider(value: $cups, in: 0...maxCups, step: 1)
                .accentColor(customColor)
        }
        Text(mlSelected ? "\(Int(waterAmount)) ml" : "\(Int(cups)) cups")
            .font(.subheadline)
            .padding(.bottom, 10)
    }
}
