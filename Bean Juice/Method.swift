//
//  Method.swift
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
    let maxCups: Double
    let maxWater: Int
    let groundLevel: String
    let startRatio: Int

    @State private var flipped: Bool = false
    @State private var animate3d: Bool = false
    
    @Binding var customColor: Color
    
    var body: some View {
        ScrollView {
                CircleImage(methodName: methodName)
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
                Text("Cups")
                    .font(.headline)
                    .padding(.bottom, -5)
                    .accessibility(identifier: "cupsLabel")
                Slider(value: $cups, in: 0...maxCups, step: 1)
                    .accentColor(customColor)
                    .accessibility(identifier: "cupsSlider")
                Text("\(Int(cups)) cups")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .accessibility(identifier: "cupsValue")
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
                Text("\(calculateWaterAmount(cupSize: cupSize, cupAmount: cups, maxWater: maxWater)) g")
                        .font(.title)
                        .accessibility(identifier: "waterValue")
                }
                .padding(.bottom, 5)
                HStack {
                    Text("Coffee")
                        .font(.title)
                        .accessibility(identifier: "coffeeLabel")
                    Spacer()
                    Text("\(calculateCoffeeAmount(cupSize: cupSize, cupAmount: cups, ratio: ratio, maxWater: maxWater), specifier: "%.1f") g")
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
            if (self.methodName == "Aeropress" && self.cups > 4) {
                self.cups = 4
            }
        }
            
    }
}
