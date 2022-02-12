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
