//
//  TranslateDemoUITests.swift
//  TranslateDemoUITests
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import XCTest

class TranslateDemoUITests: XCTestCase {
        
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
    
    func testDoubleTranslateSpanishToEnglish() {
        
        let app = XCUIApplication()
        app.navigationBars["Translate to Spanish"].buttons["Translate"].tap()
        
        
        let translatedTextTextView = app.textViews["translated text"]
        translatedTextTextView.pressForDuration(0.8);
        app.menuItems["Copy"].tap()
        
        //next view
        app.tabBars.buttons["Ingles"].tap()
        app.textViews["original text"].pressForDuration(0.8);
        
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
        app.buttons["Pegar desde el portapapeles "].tap()
        app.navigationBars["Traducir a Ingles"].buttons["Traducir"].tap()
    }
    
    func testDoubleTranslateEnglishToSpanish() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Ingles"].tap()
        app.navigationBars["Traducir a Ingles"].buttons["Traducir"].tap()
        
        
        let translatedTextTextView = app.textViews["translated text"]
        translatedTextTextView.pressForDuration(0.8);
        app.menuItems["Copy"].tap()
        
        //next view
        
        app.tabBars.buttons["Spanish"].tap()
        app.textViews["original text"].pressForDuration(0.8);
        
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
        app.buttons["Paste From Clipboard"].tap()
        app.navigationBars["Translate to Spanish"].buttons["Translate"].tap()
    }
    
}
