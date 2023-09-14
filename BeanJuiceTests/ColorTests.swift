//
//  ColorTests.swift
//  Bean JuiceTests
//
//  Created by Iiro Alhonen on 13.9.2023.
//

import SwiftUI
import XCTest

final class ColorTests: XCTestCase {

    func testColorParsing() throws {
        let mint = Color.mint
        let colorString = mint.rawValue
        let mintFromString = Color.init(rawValue: colorString)
        XCTAssertEqual(mintFromString?.colorComponents?.red, Color.mint.colorComponents?.red)
        XCTAssertEqual(mintFromString?.colorComponents?.green, Color.mint.colorComponents?.green)
        XCTAssertEqual(mintFromString?.colorComponents?.blue, Color.mint.colorComponents?.blue)
        XCTAssertEqual(mintFromString?.colorComponents?.alpha, Color.mint.colorComponents?.alpha)
    }
}
