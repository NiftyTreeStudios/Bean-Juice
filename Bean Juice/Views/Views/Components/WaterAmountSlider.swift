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

    @Binding var waterAmount: Double
    @Binding var cups: Double

    @EnvironmentObject var settings: SettingsViewModel

    // French press view
    let sizes = [350, 500, 1000, 1500]
    @State private var selectedSize: Double = 1

    var body: some View {
        let maxCups: Double = Double(method.maxWaterAmount / settings.selectedCupMlSize).isLessThanOrEqualTo(0)
            ? 1
            : Double(method.maxWaterAmount / settings.selectedCupMlSize)
        if method.name == .frenchPress {
            Text("Size")
                .font(.headline)
                .padding(.bottom, -5)
            Slider(value: $selectedSize, in: 0...Double(sizes.count - 1), step: 1).accentColor(settings.getAccentColor())
            Text("\(sizes[Int(selectedSize)]) ml")
                .font(.subheadline)
                .padding(.bottom, -5)
                .accessibility(identifier: "SizeValue")
        } else {
            Text(settings.mlSelected ? "Water" : "Cups")
                .font(.headline)
                .padding(.bottom, -5)
            if settings.mlSelected {
                Slider(value: $waterAmount, in: 0...Double(method.maxWaterAmount), step: method.mlPickerStep).accentColor(settings.getAccentColor())
            } else {
                Slider(value: $cups, in: 0...maxCups, step: 1).accentColor(settings.getAccentColor())
            }
        }
        Text(settings.mlSelected ? "\(Int(waterAmount)) ml" : "\(Int(cups)) cups")
            .font(.subheadline)
            .padding(.bottom, 10)
    }
}
