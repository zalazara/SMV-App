//
//  SMV_DetailModuleUITest.swift
//  SMV AppUITests
//
//  Created by Zalazar, Alejandro Ramon on 14/04/2020.
//  Copyright © 2020 Alejandro Zalazar. All rights reserved.
//

import XCTest

class SMV_DetailModuleUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmployeeDetail() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-UITests"]
        app.launch()
        let fetchDataButton = app.buttons["Fetch Data"]
        fetchDataButton.tap()
        
        let nameLabel = app.staticTexts["employeeName"]
        XCTAssertEqual("Alejandro Zalazar", nameLabel.label)
        
        let ageLabel = app.staticTexts["employeeAge"]
        XCTAssertEqual("61", ageLabel.label)
        
        let salaryLabel = app.staticTexts["employeeSalary"]
        XCTAssertEqual("320800", salaryLabel.label)
    }

}
