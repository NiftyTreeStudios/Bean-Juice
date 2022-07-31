//
//  Bean_JuiceTests.swift
//  Bean JuiceTests
//
//  Created by Iiro Alhonen on 25.05.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import XCTest
@testable import Bean_Juice

// swiftlint:disable:next type_name
class Bean_JuiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: calculateCoffeeAmount()

    func testCalculateCoffeeAmount() throws {
        XCTAssertEqual(
            Bean_Juice.calculateCoffeeAmount(cupSize: 10, cupAmount: 10, ratio: 10, maxWater: 100),
            10
        )
        XCTAssertEqual(
            Bean_Juice.calculateCoffeeAmount(cupSize: 20, cupAmount: 20, ratio: 20, maxWater: 200),
            10
        )
        XCTAssertEqual(
            Bean_Juice.calculateCoffeeAmount(cupSize: 200, cupAmount: 5, ratio: 18, maxWater: 2000),
            55.55555555555556
        )
        XCTAssertEqual(
            Bean_Juice.calculateCoffeeAmount(cupSize: 0, cupAmount: 0, ratio: 18, maxWater: 2000),
            0
        )
    }

    func testPerformanceCalculateCoffeeAmount() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            XCTAssertEqual(
                Bean_Juice.calculateCoffeeAmount(cupSize: 20, cupAmount: 20, ratio: 20, maxWater: 200),
                10
            )
        }
    }

    // MARK: calculateWaterAmount()

    func testCalculateWaterAmount() throws {
        XCTAssertEqual(
            Bean_Juice.calculateWaterAmount(cupSize: 10, cupAmount: 10, maxWater: 1000),
            100
        )
        XCTAssertEqual(
            Bean_Juice.calculateWaterAmount(cupSize: 20, cupAmount: 20, maxWater: 2000),
            400
        )
        XCTAssertEqual(
            Bean_Juice.calculateWaterAmount(cupSize: 200, cupAmount: 18, maxWater: 2000),
            2000
        )
        XCTAssertEqual(
            Bean_Juice.calculateWaterAmount(cupSize: 0, cupAmount: 0, maxWater: 5000),
            0
        )
    }

    func testPerformanceCalculateWaterAmount() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            XCTAssertEqual(
                Bean_Juice.calculateWaterAmount(cupSize: 10, cupAmount: 10, maxWater: 5000),
                100
            )
        }
    }

    // MARK: isValidURL()
    func testIsValidURL() throws {
        XCTAssertTrue("www.niftytreestudios.com".isValidURL)
        XCTAssertTrue("http://niftytreestudios.com".isValidURL)
        XCTAssertTrue("https://niftytreestudios.com".isValidURL)
        XCTAssertTrue("http://www.niftytreestudios.com".isValidURL)
        XCTAssertTrue("https://www.niftytreestudios.com".isValidURL)
        XCTAssertTrue("niftytreestudios.com".isValidURL)
        XCTAssertTrue("http://niftytreestudios.com/checkity/check/".isValidURL)
        XCTAssertTrue("http://niftytreestudios.com/random%20things%0A".isValidURL)
        XCTAssertTrue("mailto:contact@niftytreestudios.com".isValidURL)

        XCTAssertFalse("www.ffff".isValidURL)
        XCTAssertFalse(".......".isValidURL)
        XCTAssertFalse("   ".isValidURL)
        XCTAssertFalse("".isValidURL)
    }

}
