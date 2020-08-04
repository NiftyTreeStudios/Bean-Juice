//
//  CustomView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.6.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    @State private var selectedGround = 0
        
        let groundLevels = ["Pick one", "Fine", "Fine/Medium", "Medium", "Coarse/Medium", "Coarse"]

        @State private var ratio: Double = 13
        @State private var waterAmount: Double = 250
        
        let methodName: String = "Custom"
        let maxWater: Double = 1500
        let groundLevel: String = "Medium"
        
        @Binding var customColor: Color
        
        var body: some View {
                ScrollView {
                    VStack(alignment: .center) {
                            CircleImage(methodName: methodName)
                                .padding(.top, 10)
                        }
                        Text(methodName)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(10)
                            .accessibility(identifier: "methodNameLabel")
                                        
                    VStack {
                        Text("Ratio")
                            .font(.headline)
                            .padding(.bottom, 0)
                            .accessibility(identifier: "ratioLabel")
                        Slider(value: $ratio, in: 8...20, step: 1)
                            .accentColor(customColor)
                            .accessibility(identifier: "ratioSlider")
                        Text("1:\(Int(ratio))")
                            .font(.subheadline)
                            .padding(.bottom, 10)
                            .padding(.top, 0)
                            .accessibility(identifier: "ratioValue")
                        Text("Water")
                            .font(.headline)
                            .accessibility(identifier: "cupsLabel")
                        Slider(value: $waterAmount, in: 0...maxWater, step: 10)
                            .accentColor(customColor)
                            .accessibility(identifier: "cupsSlider")
                        Text("\(Int(waterAmount)) ml")
                            .font(.subheadline)
                            .padding(.bottom, 10)
                            .accessibility(identifier: "cupsValue")
                    }
                        .padding(.leading, 30)
                    .padding(.trailing, 30)
                    VStack {
    //                    HStack {
    //                        Text("Ground level")
    //                            .font(.headline)
    //                            .accessibility(identifier: "groundLevelLabel")
    //                        Spacer()
    //                        Text(groundLevel)
    //                            .font(.subheadline)
    //                            .accessibility(identifier: "groundLevelValue")
                        // }
                        //.padding(.bottom, 5)
                    HStack {
                        Text("Water")
                                .font(.title)
                                .accessibility(identifier: "waterLabel")
                            Spacer()
                        Text("\(waterAmount, specifier: "%.0f") g")
                                .font(.title)
                                .accessibility(identifier: "waterValue")
                        }
                        .padding(.bottom, 5)
                        HStack {
                            Text("Coffee")
                                .font(.title)
                                .accessibility(identifier: "coffeeLabel")
                            Spacer()
                            Text("\(customCoffeeAmount(water: waterAmount, ratio: ratio), specifier: "%.1f") g")
                                .font(.title)
                                .accessibility(identifier: "coffeeValue")
                        }
                        .padding(.bottom, 5)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 5)
                }
                    
            }
        }
