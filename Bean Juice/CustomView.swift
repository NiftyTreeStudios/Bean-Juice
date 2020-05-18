//
//  CustomView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
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

    @State private var flipped: Bool = false
    @State private var animate3d: Bool = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .center) {
                    ZStack() {
                        CircleImage(methodName: methodName).opacity(flipped ? 0.0 : 1.0)
                        TimerView().opacity(flipped ? 1.0 : 0.0)
                    }
                    .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis:(x: 0, y: 1)))
                    .onTapGesture {
                            withAnimation(Animation.linear(duration: 0.8)) {
                                self.animate3d.toggle()
                            }
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
                        .accentColor(.purple)
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
                        .accentColor(.purple)
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
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
