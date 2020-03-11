//
//  Chemex.swift
//  Morning Brew
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct ChemexView: View {
    var chemex = [Method(name: "Chemex", cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17)]
    var cupSizes = [
        CupSize(name: "Small", sizeMl: 118, sizeOz: 4),
        CupSize(name: "Medium", sizeMl: 177, sizeOz: 6),
        CupSize(name: "Large", sizeMl: 236, sizeOz: 8),
        CupSize(name: "X-Large", sizeMl: 355, sizeOz: 12),
        CupSize(name: "Bucket", sizeMl: 473, sizeOz: 16)
    ]

    @State var ratio: Double = 17
    @State var cups: Double = 1
    @State var cupAmount: Double = 8
    @State var water: Double = 177
    @State var coffee: Double = 15
    @State var groundLevel: String = "Medium/Coarse"
    @State var methodSelected: Bool = true
    @State var cupSizeSelected: Bool = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Bean Juice")
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
                    if !methodSelected {
                        Text("Pick method")
                    } else {
                        Text("\(Int(water) * Int(cups)) g")
                            .font(.title)
                    }
                }
                .padding(.bottom, 10)
                HStack {
                    Text("Coffee")
                        .font(.title)
                    Spacer()
                    if !methodSelected {
                        Text("Pick method")
                    } else {
                        Text("\(Double(water) * cups / ratio, specifier: "%.1f") g")
                            .font(.title)
                    }
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
