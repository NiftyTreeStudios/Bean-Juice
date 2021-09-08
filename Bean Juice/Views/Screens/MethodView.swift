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
    @State private var ratio: Double = 13
    @State private var cups: Double = 1

    let method: Method

    @Binding var mlSelected: Bool
    @State private var waterAmount: Double = 200

    @Binding var customColor: Color

    var body: some View {
        ScrollView {
            CircleImage(methodName: getMethodName(method: method.name), isRecipeView: false)
            VStack {
                CoffeeRatioSlider(ratio: $ratio, customColor: $customColor)
                WaterAmountSlider(
                    method: method,
                    cups: $cups,
                    cupSize: $cupSize,
                    mlSelected: $mlSelected,
                    customColor: $customColor
                )
            }
            VStack(spacing: 8) {
                HStack {
                    Text("Ground level").font(.headline)
                    Spacer()
                    Text(method.grounds).font(.subheadline)
                }

                HStack {
                    Text("Water").font(.title)
                    Spacer()
                    Text(mlSelected
                            ? "\(waterAmount, specifier: "%.0f") g"
                            : "\(calculateWaterAmount(cupSize: cupSize, cupAmount: cups, maxWater: method.maxWaterAmount)) g")
                        .font(.title)
                }

                HStack {
                    Text("Coffee").font(.title)
                    Spacer()
                    Text(mlSelected
                            ? "\(customCoffeeAmount(water: waterAmount, ratio: ratio), specifier: "%.1f") g"
                            : "\(calculateCoffeeAmount(cupSize: cupSize, cupAmount: cups, ratio: ratio, maxWater: method.maxWaterAmount), specifier: "%.1f") g")
                        .font(.title)
                }
            }
            .navigationTitle(getMethodName(method: method.name))
            .navigationBarItems(
                /*
                 Note: this works once. If you hit the back button and try again, nothing happens.
                 Short googling revealed that this seems to be a SwiftUI bug.
                 */
                trailing: NavigationLink(
                    destination: InformationScreen(methodName: method.name)) {
                        Image(systemName: "info.circle")
                    }
            )
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.bottom, 5)
        .onAppear {
            self.ratio = Double(method.startRatio)
            if getMethodName(method: method.name) == "Aeropress" && self.cups > 4 {
                self.cups = 4
            }
            if getMethodName(method: method.name) == "Aeropress" && self.waterAmount > Double(method.maxWaterAmount) {
                self.waterAmount = Double(method.maxWaterAmount)
            }
            StoreReviewHelper.checkAndAskForReview()
            StoreReviewHelper.incrementAppOpenedCount()
        }
    }
}
