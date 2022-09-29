//
//  LeftoverView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.9.2022.
//

import SwiftUI

struct LeftoverView: View {
    @State private var coffeeAmount: String = ""
    @State private var coffeeRatio: Double = 17

    var body: some View {
        ScrollView {
            CircleImage(methodName: getMethodName(method: .custom))
            CoffeeRatioSlider(ratio: $coffeeRatio)
            HStack(alignment: .center) {
                Text("Coffee")
                    .font(.title)
                Spacer(minLength: 50)
                TextField("Coffee amount", text: $coffeeAmount)
                    .keyboardType(.decimalPad)
                    .font(.title3)
                    .padding(5)
                    .textFieldStyle(.roundedBorder)
            }
            HStack {
                Text("Water")
                    .font(.title)
                Spacer()
                Text("\((Double(coffeeAmount) ?? 0) * coffeeRatio, specifier: "%.0f") g")
                    .font(.title)
            }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 5)
        .navigationTitle("Leftovers")
    }
}
