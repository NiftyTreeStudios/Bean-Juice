//
//  Recipe.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation

struct Recipe: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var brewMethod: MethodName
    var groundSize: String
    var coffeeAmount: String
    var waterAmount: Int
    var brewTime: Int
    var additionalInformation: String

    init(from oldRecipe: OldRecipe) {
        self.id = UUID()
        self.name = oldRecipe.name
        self.brewMethod = oldRecipe.brewMethod
        self.groundSize = oldRecipe.groundSize
        self.coffeeAmount = oldRecipe.coffeeAmount
        self.waterAmount = oldRecipe.waterAmount
        self.brewTime = oldRecipe.brewTime
        self.additionalInformation = oldRecipe.additionalInformation ?? ""
    }

    init(from recipeWithoutID: RecipeWithoutID) {
        self.id = UUID()
        self.name = recipeWithoutID.name
        self.brewMethod = recipeWithoutID.brewMethod
        self.groundSize = recipeWithoutID.groundSize ?? ""
        self.coffeeAmount = String(recipeWithoutID.coffeeAmount)
        self.waterAmount = recipeWithoutID.waterAmount
        self.brewTime = recipeWithoutID.brewTime ?? 0
        self.additionalInformation = recipeWithoutID.additionalInformation ?? ""
    }

    init(
        id: UUID = UUID(),
        name: String,
        brewMethod: MethodName,
        groundSize: String?,
        coffeeAmount: Double,
        waterAmount: Int,
        brewTime: Int?,
        additionalInformation: String?
    ) {
        self.id = id
        self.name = name
        self.brewMethod = brewMethod
        self.groundSize = groundSize ?? ""
        self.coffeeAmount = String(coffeeAmount)
        self.waterAmount = waterAmount
        self.brewTime = brewTime ?? 0
        self.additionalInformation = additionalInformation ?? ""
    }
}

struct RecipeWithoutID: Codable, Equatable {
    let name: String
    let brewMethod: MethodName
    let groundSize: String?
    let coffeeAmount: Double
    let waterAmount: Int
    let brewTime: Int?
    let additionalInformation: String?
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
