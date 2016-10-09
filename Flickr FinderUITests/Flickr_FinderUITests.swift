//
//  Flickr_FinderUITests.swift
//  Flickr FinderUITests
//
//  Created by Mohamed Sayed on 07/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import XCTest

class Flickr_FinderUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Functionality
    func testKeyboardBehaviour() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let enterSearchQuerySearchField = app.searchFields["Enter Your Search Query"]
        
        XCTAssert(app.keyboards.count == 0, "The keyboard should be hidden on the start of the application")
        
        enterSearchQuerySearchField.tap()
        XCTAssert(app.keyboards.count > 0, "The keyboard is not shown")
        
        enterSearchQuerySearchField.typeText("AMS")
        app.buttons["Search"].tap()
        
        XCTAssert(app.keyboards.count == 0, "The keyboard should be hidden by now")
    }
    
    func testGettingResults() {
        
        let app = XCUIApplication()
        
        let enterSearchQuerySearchField = app.searchFields["Enter Your Search Query"]
        enterSearchQuerySearchField.tap()
        enterSearchQuerySearchField.typeText("Amsterdam")
        app.buttons["Search"].tap()
        let table = app.tables.element
        XCTAssertTrue(table.cells.count>0)
    }
    
    // MARK: -View loading tests
    func testIfTheTableViewBehavior() {
        let app = XCUIApplication()
        
        //At first the table should be hidden
        let table = app.tables.element
        XCTAssertFalse(table.exists)
    }
    
    func testIfTheTableViewBehaviorAfterSearch() {
        let app = XCUIApplication()
        
        let table = app.tables.element
        let enterSearchQuerySearchField = app.searchFields["Enter Your Search Query"]
        enterSearchQuerySearchField.tap()
        enterSearchQuerySearchField.typeText("Amsterdam")
        app.buttons["Search"].tap()
        //Tableview should be visible after search
        XCTAssertTrue(table.exists)
    }
    
    func testNoResults() {
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let enterYourSearchQuerySearchField = app.searchFields["Enter Your Search Query"]
        enterYourSearchQuerySearchField.tap()
        enterYourSearchQuerySearchField.typeText("amsterdam")
        app.buttons["Search"].tap()
        enterYourSearchQuerySearchField.tap()
        enterYourSearchQuerySearchField.typeText("qwefjsdhfjsfhdjdj")
        app.buttons["Search"].tap()
        let table = app.tables.element
        XCTAssertTrue(table.cells.count==0)
    }
}
