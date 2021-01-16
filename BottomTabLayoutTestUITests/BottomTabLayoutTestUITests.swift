//
//  BottomTabLayoutTestUITests.swift
//  BottomTabLayoutTestUITests
//
//  Created by JaesungMoon on 2021/01/13.
//

import XCTest

class BottomTabLayoutTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation1 = XCTestExpectation(description: "expectation1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation1.fulfill()
        }
        XCTWaiter().wait(for: [expectation1], timeout: 10)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Item 2"].tap()
        
        
        let expectation2 = XCTestExpectation(description: "expectation2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation2.fulfill()
        }
        XCTWaiter().wait(for: [expectation2], timeout: 10)
        
        tabBar.buttons["Item 3"].tap()
        
        tabBar.buttons["Item 4"].tap()
        
        tabBar.buttons["Item 5"].tap()
        
        tabBar.buttons["Item 3"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.staticTexts["登録タスク"].tap()
        collectionViewsQuery.staticTexts["予定"].tap()
        collectionViewsQuery.staticTexts["勉強タスク"].tap()

        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
