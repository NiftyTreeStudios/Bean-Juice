import SwiftUI

/// Model representing cup size.
public struct CupSize {
    public let name: String
    public var sizeMl: Int
    
    public init(
        name: String,
        sizeMl: Int
    ) {
        self.name = name
        self.sizeMl = sizeMl
    }
}

/// Custom color struct
public struct CustomColor {
    public let name: String
    public let color: Color
    
    public init(
        name: String,
        color: Color
    ) {
        self.name = name
        self.color = color
    }
}

/// Method struct.
public struct BrewMethod {
    public let name: MethodName
    public var maxWaterAmount: Int
    public var mlPickerStep: Double
    public let grounds: String
    public let startRatio: Int
    
    public init(
        name: MethodName,
        maxWaterAmount: Int,
        mlPickerStep: Double,
        grounds: String,
        startRatio: Int
    ) {
        self.name = name
        self.maxWaterAmount = maxWaterAmount
        self.mlPickerStep = mlPickerStep
        self.grounds = grounds
        self.startRatio = startRatio
    }
}

public enum MethodName: String, Codable, CaseIterable {
    case aeropress, chemex, coldBrew, custom, dripMachine, frenchPress, v60
}

public func getMethodName(method: MethodName) -> String {
    switch method {
    case .aeropress:
        return "AeroPress"
    case .chemex:
        return "Chemex"
    case .coldBrew:
        return "Cold Brew"
    case .custom:
        return "Custom"
    case .dripMachine:
        return "Drip Machine"
    case .frenchPress:
        return "French Press"
    case .v60:
        return "V60"
    }
}

extension MethodName: Identifiable {
    public var id: MethodName { self }
}
