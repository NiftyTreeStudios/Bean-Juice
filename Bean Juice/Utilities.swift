//
//  Utilities.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

func calculateCoffeeAmount(water: Double, cups: Double, ratio: Double) -> Double {
    let coffeeAmount = Double(water) * cups / ratio
    return coffeeAmount
}

func calculateWaterAmount(water: Double, cups: Double) -> Int {
    let waterAmount = Int(water) * Int(cups)
    return waterAmount
}
