//
//  MethodView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 6.4.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct MethodView: View {

    @Binding var cupSize: Double
    @Binding var ratio: Double
    @Binding var cups: Double

    let methodName: String
    var maxCups: Double {
        if cupSize > Double(maxWater) {
            self.cupSize = Double(maxWater)
            return 1
        } else {
            return Double(maxWater) / cupSize
        }
    }
    let maxWater: Int
    let groundLevel: String
    let startRatio: Int

    @Binding var mlSelected: Bool
    @State private var waterAmount: Double = 250

    @Binding var customColor: Color

    var body: some View {
        ScrollView {
            CircleImage(methodName: methodName, isRecipeView: false)
            Text(methodName)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(10)
                .multilineTextAlignment(.center)
            VStack {
                Text("Ratio")
                    .font(.headline)
                    .padding(.bottom, -5)
                Slider(value: $ratio, in: 8...20, step: 1)
                    .accentColor(customColor)
                Text("1:\(Int(ratio))")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .padding(.top, 0)

                Text(mlSelected ? "Water" : "Cups")
                    .font(.headline)
                    .padding(.bottom, -5)
                if mlSelected {
                    Slider(value: $waterAmount, in: 0...Double(maxWater), step: 10)
                        .accentColor(customColor)
                } else {
                    Slider(value: $cups, in: 0...maxCups, step: 1)
                        .accentColor(customColor)
                }
                Text(mlSelected ? "\(Int(waterAmount)) ml" : "\(Int(cups)) cups")
                    .font(.subheadline)
                    .padding(.bottom, 10)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            VStack {
                HStack {
                    Text("Ground level")
                        .font(.headline)
                    Spacer()
                    Text(groundLevel)
                        .font(.subheadline)
                }
                .padding(.bottom, 5)

                HStack {
                    Text("Water")
                        .font(.title)
                    Spacer()
                    Text(mlSelected
                            ? "\(waterAmount, specifier: "%.0f") g"
                            : "\(calculateWaterAmount(cupSize: cupSize, cupAmount: cups, maxWater: maxWater)) g")
                        .font(.title)
                }
                .padding(.bottom, 5)

                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    Text(mlSelected
                            ? "\(customCoffeeAmount(water: waterAmount, ratio: ratio), specifier: "%.1f") g"
                            : "\(calculateCoffeeAmount(cupSize: cupSize, cupAmount: cups, ratio: ratio, maxWater: maxWater), specifier: "%.1f") g")
                        .font(.title)
                }
                .padding(.bottom, 5)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 5)
        }.onAppear {
            self.ratio = Double(self.startRatio)
            if self.methodName == "Aeropress" && self.cups > 4 {
                self.cups = 4
            }
            if self.methodName == "Aeropress" && self.waterAmount > Double(self.maxWater) {
                self.waterAmount = Double(self.maxWater)
            }
            StoreReviewHelper.checkAndAskForReview()
            StoreReviewHelper.incrementAppOpenedCount()
        }
    }
}
