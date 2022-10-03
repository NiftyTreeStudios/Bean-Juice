//
//  Utilities.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Coffee and water

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

// MARK: Time functions

/**
 Converts hours, minutes and seconds into seconds
 
 - Parameters:
    - hours: Int representing hours
    - minutes: Inte representing minutes
    - seconds: Int representing seconds
 
 - Returns: Int of seconds
 */
func convertToSeconds(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Int {
    let hoursAsSeconds = hours * 3600
    let minutesAsSeconds = minutes * 60
    return hoursAsSeconds + minutesAsSeconds + seconds
}

/// Returns a tuple of hours, minutes, seconds from seconds.
/// - Parameters:
///     - time: Int representing seconds
/// - Returns: Tuple (hours, minutes, seconds)
///
func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

/// Formats an given int into HH:MM:SS format.
/// - Parameters:
///     - time: Int representing seconds
///
func formattedTime(time: (Int, Int, Int)) -> String {
    let (hours, minutes, seconds) = time
    var minutesString = "00"
    if minutes < 10 {
        minutesString = "0\(minutes)"
    } else {
        minutesString = String(minutes)
    }
    var secondsString = "00"
    if seconds < 10 {
        secondsString = "0\(seconds)"
    } else {
        secondsString = String(seconds)
    }
    if hours > 1 {
        return "\(hours):\(minutesString):\(secondsString)"
    } else {
        return "\(minutesString):\(secondsString)"
    }
}

// MARK: Recipes

/**
 Adds a new recipe to the recipes array.
 
 - Parameters:
    - recipe: recipe to be added.
    - recipes: the array of recipes
 
 - Returns: a new array of recipes with the added recipe.
 */
func addNewRecipe(recipe: Recipe, in recipes: [Recipe]) -> [Recipe] {
    var newRecipes = recipes
    if recipe.name.isEmpty {
        print("Couldn't save a new recipe")
        return recipes
    } else {
        newRecipes.append(
            Recipe(
                name: recipe.name,
                brewMethod: recipe.brewMethod,
                groundSize: recipe.groundSize,
                coffeeAmount: recipe.coffeeAmount,
                waterAmount: recipe.waterAmount,
                brewTime: recipe.brewTime,
                additionalInformation: recipe.additionalInformation
            )
        )
        return newRecipes
    }
}

/// Saves recipes into user defaults.
/// - Parameters:
///   - recipes: The recipes that are being saved.
func saveRecipesToUserDefaults(_ recipes: [Recipe]) {
    let data = recipes.map { try? JSONEncoder().encode($0) }
    print("☕️ Saving recipes: \n \(data)")
    UserDefaults.standard.set(data, forKey: "Recipes")
}

/// Loads recipes from user defaults.
/// - Returns: A array of recipes.
func loadRecipesFromUserDefaults() -> [Recipe] {
    print("☕️ Loading recipes...")
    guard let encodedData = UserDefaults.standard.array(forKey: "Recipes") as? [Data] else {
        return []
    }
    let recipes = encodedData.map {
        if let recipe = try? JSONDecoder().decode(Recipe.self, from: $0) {
            return recipe
        } else {
            if let oldRecipe = try? JSONDecoder().decode(OldRecipe.self, from: $0) {
                return Recipe(from: oldRecipe)
            } else {
                print("Failed to load recipe.")
                return Recipe(name: "test", brewMethod: .custom, groundSize: "test", coffeeAmount: 1.23, waterAmount: 69, brewTime: 111, additionalInformation: "Nooope")
            }
        }
    }
    return recipes
}
