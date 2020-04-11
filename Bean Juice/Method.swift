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

    @Binding var ratio: Double
    @Binding var cups: Double
    
    let methodName: String
    let maxCups: Double
    @Binding var cupSize: Double
    let groundLevel: String

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(methodName + "-Big")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                Text(methodName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(10)
                                
            VStack {
                Text("Ratio")
                    .font(.headline)
                    .padding(.bottom, 0)
                Slider(value: $ratio, in: 12...20, step: 1)
                    .accentColor(.purple)
                Text("1:\(Int(ratio))")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .padding(.top, 0)
                Text("Cups")
                    .font(.headline)
                Slider(value: $cups, in: 0...maxCups, step: 1)
                    .accentColor(.purple)
                Text("\(Int(cups)) cups")
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
                    Text("\(calculateWaterAmount(water: cupSize, cups: cups)) g")
                        .font(.title)
                }
                .padding(.bottom, 5)
                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    Text("\(calculateCoffeeAmount(water: cupSize, cups: cups, ratio: ratio), specifier: "%.1f") g")
                        .font(.title)
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
