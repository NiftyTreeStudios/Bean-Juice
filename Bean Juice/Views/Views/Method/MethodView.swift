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
                             : "\(calculateWaterAmount(cupSize: Double(settings.selectedCupMlSize), cupAmount: viewModel.cups, maxWater: method.maxWaterAmount)) g")
                            .font(.title)
                    }

                    HStack {
                        Text("Coffee").font(.title)
                        Spacer()
                        Text(settings.mlSelected
                             ? "\(customCoffeeAmount(water: viewModel.waterAmount, ratio: viewModel.ratio), specifier: "%.1f") g"
                             : "\(calculateCoffeeAmount(cupSize: Double(settings.selectedCupMlSize), cupAmount: viewModel.cups, ratio: viewModel.ratio, maxWater: method.maxWaterAmount), specifier: "%.1f") g")
                            .font(.title)
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
        .onAppear {
            viewModel.setUp(for: method)
            StoreReviewHelper.checkAndAskForReview()
            StoreReviewHelper.incrementAppOpenedCount()
        }
    }
}
