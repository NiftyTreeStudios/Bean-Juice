//
//  Bean_JuiceUITests.swift
//  Bean JuiceUITests
//
//  Created by Iiro Alhonen on 17.4.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import XCTest

class Bean_JuiceUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialViewState() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let image = app.images.element
        let methodName = app.staticTexts["methodNameLabel"]
        
        let ratioLabel = app.staticTexts["ratioLabel"]
        let ratioSlider = app.sliders["ratioSlider"]
        let ratioValue = app.staticTexts["ratioValue"]
        
        let cupsLabel = app.staticTexts["cupsLabel"]
        let cupsSlider = app.sliders["cupsSlider"]
        let cupsValue = app.staticTexts["cupsValue"]
        
        let groundLevelLabel = app.staticTexts["groundLevelLabel"]
        let groundLevelValue = app.staticTexts["groundLevelValue"]
        
        let waterLabel = app.staticTexts["waterLabel"]
        let waterValue = app.staticTexts["waterValue"]

        let coffeeLabel = app.staticTexts["coffeeLabel"]
        let coffeeValue = app.staticTexts["coffeeValue"]

        
        
        XCTAssert(image.exists)
        XCTAssert(image.value != nil)
        
        XCTAssert(methodName.exists)
        XCTAssertEqual(methodName.label, "Aeropress")
        
        XCTAssert(ratioLabel.exists)
        XCTAssertEqual(ratioLabel.label, "Ratio")
        XCTAssert(ratioSlider.exists)
        XCTAssert(ratioValue.exists)
        XCTAssertEqual(ratioValue.label, "1:13")
        
        XCTAssert(cupsLabel.exists)
        XCTAssertEqual(cupsLabel.label, "Cups")
        XCTAssert(cupsSlider.exists)
        XCTAssert(cupsValue.exists)
        XCTAssertEqual(cupsValue.label, "1 cups")
        
        XCTAssert(groundLevelLabel.exists)
        XCTAssertEqual(groundLevelLabel.label, "Ground level")
        XCTAssert(groundLevelValue.exists)
        XCTAssertEqual(groundLevelValue.label, "Medium/Fine")
        
        XCTAssert(waterLabel.exists)
        XCTAssertEqual(waterLabel.label, "Water")
        XCTAssert(waterValue.exists)
        XCTAssertEqual(waterValue.label, "177 g")
        
        XCTAssert(coffeeLabel.exists)
        XCTAssertEqual(coffeeLabel.label, "Coffee")
        XCTAssert(coffeeValue.exists)
        XCTAssertEqual(coffeeValue.label, "13.6 g")
    }
}
