//
//  Utilities.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

func calculateCoffeeAmount(cupSize: Double, cupAmount: Double, ratio: Double) -> Double {
    let coffeeAmount = Double(cupSize) * cupAmount / ratio
    return coffeeAmount
}

func calculateWaterAmount(cupSize: Double, cupAmount: Double, maxWater: Int) -> Int {
    let waterAmount = Int(cupSize) * Int(cupAmount)
    if waterAmount > maxWater {
        return maxWater
    } else {
        return waterAmount
        
    }
}
