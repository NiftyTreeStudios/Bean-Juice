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

    let method: Method

    @EnvironmentObject var settings: SettingsViewModel
    @StateObject private var viewModel = MethodViewModel()

    @State private var textFieldString: String = ""

    var body: some View {
        ScrollView {
            VStack {
                CircleImage(methodName: getMethodName(method: method.name))
                VStack {
                    CoffeeRatioSlider(ratio: $viewModel.ratio)
                    WaterAmountSlider(
                        method: method,
                        waterAmount: $viewModel.waterAmount,
                        cups: $viewModel.cups
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
                        Text(settings.mlSelected
                             ? "\(viewModel.waterAmount, specifier: "%.0f") g"
                             : "\(calculateWaterAmount(cupSize: Double(settings.selectedCupMlSize), cupAmount: viewModel.cups, maxWater: method.maxWaterAmount)) g") // swiftlint:disable:this line_length
                            .font(.title)
                            .onTapGesture {
                                print("Water amount tapped 💧")
                                viewModel.waterAlertShown = true
                            }
                    }

                    HStack {
                        Text("Coffee").font(.title)
                        Spacer()
                        Text(settings.mlSelected
                             ? "\(customCoffeeAmount(water: viewModel.waterAmount, ratio: viewModel.ratio), specifier: "%.1f") g" // swiftlint:disable:this line_length
                             : "\(calculateCoffeeAmount(cupSize: Double(settings.selectedCupMlSize), cupAmount: viewModel.cups, ratio: viewModel.ratio, maxWater: method.maxWaterAmount), specifier: "%.1f") g") // swiftlint:disable:this line_length
                            .font(.title)
                            .onTapGesture {
                                print("Coffee amount tapped ☕️")
                                // viewModel.coffeeAlertShown = true
                                // TODO: implement custom coffee amount usage
                            }
                    }
                }
                .navigationTitle(getMethodName(method: method.name))
                .navigationBarItems(
                    trailing: NavigationLink(
                        destination: InformationScreen(methodName: method.name)) {
                            Image(systemName: "info.circle")
                        }
                )
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 5)
        }
        .alert(
            "Enter coffee amount",
            isPresented: $viewModel.coffeeAlertShown
        ) {
            TextField(
                "Enter coffee amount",
                text: $textFieldString
            )
            .keyboardType(.decimalPad)
            Button("OK", action: updateCoffeeAmount)
        }
        .alert(
            "Enter water amount",
            isPresented: $viewModel.waterAlertShown
        ) {
            TextField(
                "Enter water amount",
                text: $textFieldString
            )
            .keyboardType(.decimalPad)
            Button("OK", action: updateWaterAmount)
        }
        .onAppear {
            viewModel.setUp(for: method)
            StoreReviewHelper.checkAndAskForReview()
            StoreReviewHelper.incrementAppOpenedCount()
        }
    }

    func updateCoffeeAmount() {
        print("Updated coffee amount ☕️")

    }

    func updateWaterAmount() {
        print("Updated water amount 💧")
        viewModel.waterAmount = Double(textFieldString) ?? viewModel.waterAmount
        textFieldString = ""
    }
}
