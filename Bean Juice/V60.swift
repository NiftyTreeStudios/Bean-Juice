//
//  V60.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct V60View: View {
    var V60 = [Method(name: "V60", cupAmount: 4, grounds: "Medium", startRatio: 13)]

    @State private var ratio: Double = 17
    @State private var cups: Double = 1
    private var cupAmount: Double = 4
    private var water: Double = 177
    private var groundLevel: String = "Medium"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("V60")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                                
            VStack {
                Text("Ratio")
                    .font(.title)
                Slider(value: $ratio, in: 12...20, step: 1)
                    .accentColor(Color("highlight"))
                Text("1:\(Int(ratio))")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                Text("Cups")
                    .font(.title)
                Slider(value: $cups, in: 0...cupAmount, step: 1)
                    .accentColor(Color("highlight"))
                Text("\(Int(cups)) cups")
                    .font(.subheadline)
            }
                .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 10)
            VStack {
                HStack {
                    Text("Ground level")
                        .font(.title)
                    Spacer()
                    Text(groundLevel)
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
            HStack {
                Text("Water")
                        .font(.title)
                    Spacer()
                    Text("\(Int(water) * Int(cups)) g")
                        .font(.title)
                }
                .padding(.bottom, 10)
                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    Text("\(Double(water) * cups / ratio, specifier: "%.1f") g")
                        .font(.title)
                }
                .padding(.bottom, 10)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 10)
        }
            
        }
    }
}

