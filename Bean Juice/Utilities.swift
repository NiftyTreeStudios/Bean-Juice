//
//  Utilities.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

/// Calculates coffee amount using calculateWaterAmount and ratio
/// - Parameters:
///     - cupSize: The cup size user has selected in the settings page. Used by calculateWaterAmount().
///     - cupAmount: The cup amount user has selected using the slider. Used by calculateWaterAmount().
///     - ratio: Coffee to water ratio, selected by the user using the slider.
///     - maxWater: The maximum amount of water the brew method can handle.
func calculateCoffeeAmount(cupSize: Double, cupAmount: Double, ratio: Double, maxWater: Int) -> Double {
    let waterAmount = calculateWaterAmount(cupSize: cupSize, cupAmount: cupAmount, maxWater: maxWater)
    let coffeeAmount = Double(waterAmount) / ratio
    return coffeeAmount
}

/// Calculates water amount according to user input of cup size, cup amount and maximum water amount.
/// - Parameters:
///     - cupSize: The cup size user has selected in the settings page.
///     - cupAmount: The cup amount user has selected using the slider.
///     - maxWater: The maximum amount of water the brew method can handle.
func calculateWaterAmount(cupSize: Double, cupAmount: Double, maxWater: Int) -> Int {
    let waterAmount = Int(cupSize) * Int(cupAmount)
    if waterAmount > maxWater {
        return maxWater
    } else {
        return waterAmount
    }
}

/// Calculates coffee amount using ml and coffee to water ratio selected by the user.
/// - Parameters:
///     - water: amount of water
///     - ratio: coffee to water ratio
///
func customCoffeeAmount(water: Double, ratio: Double) -> Double {
    let customCoffeeAmount = water / ratio
    return customCoffeeAmount
}
