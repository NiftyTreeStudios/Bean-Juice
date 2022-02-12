//
//  MethodViewModel.swift
//  MethodViewModel
//
//  Created by Iiro Alhonen on 09.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import Models

final class MethodViewModel: ObservableObject {

    @Published var ratio: Double = 13
    @Published var cups: Double = 1
    @Published var waterAmount: Double = 200

    func setUp(for method: BrewMethod) {
        ratio = Double(method.startRatio)
        if method.name == .aeropress && cups > 4 {
            cups = 4
        }
        if waterAmount > Double(method.maxWaterAmount) {
            waterAmount = Double(method.maxWaterAmount)
        }
    }

}
