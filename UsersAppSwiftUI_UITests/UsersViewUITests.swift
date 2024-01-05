//
//  UsersViewUITests.swift
//  UsersAppSwiftUI_UITests
//
//  Created by Ewelina on 04/01/2024.
//

import XCTest

final class UsersViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_UsersView_fetchUsersButton_shouldExist() {
        
        let button = app.buttons["Click to download users"]
        XCTAssertTrue(button.exists)
    }
    
    func test_UsersView_fetchUsersButton_shouldFetchUsers() {
        
        let button = app.buttons["Click to download users"]
        button.tap()
        
        let navBarExists = app.navigationBars["Users"].waitForExistence(timeout: 5)
        
        XCTAssertTrue(navBarExists)
    }
    
    func test_UsersView_fetchUsersButton_whenFetchUsers_shouldNavigateToUserDetailViewElementAndGoBack() {
        let button = app.buttons["Click to download users"]
        button.tap()
        
        let usersStaticText = app.navigationBars["Users"].staticTexts["Users"]
        usersStaticText.tap()
        
        let collectionElement = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Leanne Graham"]/*[[".cells.buttons[\"Leanne Graham\"]",".buttons[\"Leanne Graham\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        collectionElement.tap()
        
        let backUsersButton = app.navigationBars.buttons["Users"]
        backUsersButton.tap()
        
        XCTAssertTrue(usersStaticText.exists)
    }
    
    func test_UsersDetailView_AddressElement_shouldShowSheetAndGoBack() {
        
        let button = app.buttons["Click to download users"]
        button.tap()
        
        let usersStaticText = app.navigationBars["Users"].staticTexts["Users"]
        usersStaticText.tap()
        
        let collectionElement = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Leanne Graham"]/*[[".cells.buttons[\"Leanne Graham\"]",".buttons[\"Leanne Graham\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        collectionElement.tap()
        
        let addressElement = app.scrollViews.otherElements.staticTexts["Address: CLICK ME"]
        addressElement.tap()
        
        let backButtonOnSheet =  app.buttons["Close"]
        backButtonOnSheet.tap()
        
        let backUsersButton = app.navigationBars.buttons["Users"]
        
        XCTAssertTrue(backUsersButton.exists)
    }
    
    func test_UsersDetailView_CompanyElement_shouldShowSheetAndGoBack() {
        
        let button = app.buttons["Click to download users"]
        button.tap()
        
        let usersStaticText = app.navigationBars["Users"].staticTexts["Users"]
        usersStaticText.tap()
        
        let collectionElement = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Leanne Graham"]/*[[".cells.buttons[\"Leanne Graham\"]",".buttons[\"Leanne Graham\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        collectionElement.tap()
        
        let addressElement = app.scrollViews.otherElements.staticTexts["Company: CLICK ME"]
        addressElement.tap()
        
        let backButtonOnSheet =  app.buttons["Close"]
        backButtonOnSheet.tap()
        
        let backUsersButton = app.navigationBars.buttons["Users"]
        
        XCTAssertTrue(backUsersButton.exists)
    }
}
