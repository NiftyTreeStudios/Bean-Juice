//
//  FrenchPressView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.6.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct FrenchPressView: View {

    @Binding var cupSize: Double
    @Binding var ratio: Double
    @Binding var cups: Double

    let methodName: String = "French Press"
    let maxCups: Double = 8
    let maxWater: Int = 1500
    let groundLevel: String = "Coarse"
    let startRatio: Int = 18

    let sizes = [350, 500, 1000, 1500]
    @State private var selectedSize: Double = 1

    @State private var flipped: Bool = false
    @State private var animate3d: Bool = false

    @Binding var customColor: Color

    var body: some View {
        ScrollView {
            CircleImage(methodName: methodName, isRecipeView: false)
                    .padding(.top, 10)
                Text(methodName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(10)
                    .accessibility(identifier: "methodNameLabel")
            VStack {
                Text("Ratio")
                    .font(.headline)
                    .padding(.bottom, -5)
                    .accessibility(identifier: "ratioLabel")
                Slider(value: $ratio, in: 8...20, step: 1)
                    .accentColor(customColor)
                    .accessibility(identifier: "ratioSlider")
                Text("1:\(Int(ratio))")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .padding(.top, 0)
                    .accessibility(identifier: "ratioValue")
                Text("Size")
                    .font(.headline)
                    .padding(.bottom, -5)
                    .accessibility(identifier: "SizeLabel")
                Slider(value: $selectedSize, in: 0...Double(sizes.count - 1), step: 1)
                    .accentColor(customColor)
                    .accessibility(identifier: "SizeSlider")
                Text("\(sizes[Int(selectedSize)]) ml")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .accessibility(identifier: "SizeValue")
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            VStack {
                HStack {
                    Text("Ground level")
                        .font(.headline)
                        .accessibility(identifier: "groundLevelLabel")
                    Spacer()
                    Text(groundLevel)
                        .font(.subheadline)
                        .accessibility(identifier: "groundLevelValue")
                }
                .padding(.bottom, 5)
            HStack {
                Text("Water")
                        .font(.title)
                        .accessibility(identifier: "waterLabel")
                    Spacer()
                Text("\(sizes[Int(selectedSize)]) g")
                        .font(.title)
                        .accessibility(identifier: "waterValue")
                }
                .padding(.bottom, 5)
                HStack {
                    Text("Coffee")
                        .font(.title)
                        .accessibility(identifier: "coffeeLabel")
                    Spacer()
                    Text("\(Double(sizes[Int(selectedSize)]) / ratio, specifier: "%.1f") g")
                        .font(.title)
                        .accessibility(identifier: "coffeeValue")
                }
                .padding(.bottom, 5)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 5)
        }.onAppear {
            self.ratio = Double(self.startRatio)
        }
    }
}
