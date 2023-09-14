//
//  ColorExtension.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 1.8.2022.
//

import SwiftUI

extension Color {
    static var background = Color("background")
    static var coffee = Color("coffee")
}

extension Color {
    typealias SystemColor = UIColor

    // swiftlint:disable:next: large_tuple
    public var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard SystemColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            // Pay attention that the color should be convertible into RGB format
            // Colors using hue, saturation and brightness won't work
            return nil
        }

        print("COMPONENTS: red \(red), green \(green), blue: \(blue), alpha: \(alpha)")
        return (red, green, blue, alpha)
    }
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue, alpha
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(Double.self, forKey: .red)
        let green = try container.decode(Double.self, forKey: .green)
        let blue = try container.decode(Double.self, forKey: .blue)
        let alpha = try container.decode(Double.self, forKey: .alpha)

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }

    public func encode(to encoder: Encoder) throws {
        guard let colorComponents = self.colorComponents else {
            return
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(colorComponents.red, forKey: .red)
        try container.encode(colorComponents.green, forKey: .green)
        try container.encode(colorComponents.blue, forKey: .blue)
        try container.encode(colorComponents.alpha, forKey: .alpha)
    }
}

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        let newString = rawValue.replacingOccurrences(of: ",", with: "")
        let components = newString.components(separatedBy: .whitespaces)
        let cgFloatComponents = components.map { item in
            CGFloat((item as NSString).doubleValue)
        }
        let color = UIColor(
            red: cgFloatComponents[0],
            green: cgFloatComponents[1],
            blue: cgFloatComponents[2],
            alpha: cgFloatComponents[3]
        )
        self = Color(color)
    }

    public var rawValue: String {
        guard let colorComponents = self.colorComponents else {
            return ""
        }
        // swiftlint:disable:next line_length
        let string = "\(colorComponents.red), \(colorComponents.green), \(colorComponents.blue), \(colorComponents.alpha)"
        return string
    }
}
