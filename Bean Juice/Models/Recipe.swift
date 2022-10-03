//
//  Recipe.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation

struct Recipe: Codable, Equatable {
    let name: String
    let brewMethod: MethodName
    let groundSize: String?
    let coffeeAmount: Double
    let waterAmount: Int
    let brewTime: Int?
    let additionalInformation: String?

    init(from oldRecipe: OldRecipe) {
        self.name = oldRecipe.name
        self.brewMethod = oldRecipe.brewMethod
        self.groundSize = oldRecipe.groundSize
        self.coffeeAmount = Double(oldRecipe.coffeeAmount) ?? 0
        self.waterAmount = oldRecipe.waterAmount
        self.brewTime = oldRecipe.brewTime
        self.additionalInformation = oldRecipe.additionalInformation
    }

    init(
        name: String,
        brewMethod: MethodName,
        groundSize: String?,
        coffeeAmount: Double,
        waterAmount: Int,
        brewTime: Int?,
        additionalInformation: String?
    ) {
        self.name = name
        self.brewMethod = brewMethod
        self.groundSize = groundSize
        self.coffeeAmount = coffeeAmount
        self.waterAmount = waterAmount
        self.brewTime = brewTime
        self.additionalInformation = additionalInformation
    }
}

struct OldRecipe: Codable, Equatable {
    let name: String
    let brewMethod: MethodName
    let groundSize: String
    let coffeeAmount: String
    let waterAmount: Int
    let brewTime: Int
    let additionalInformation: String?
}
