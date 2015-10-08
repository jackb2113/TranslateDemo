//
//  BaseViewControllerTests.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/8/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import XCTest

@testable import TranslateDemo

class BaseViewControllerTests: XCTestCase {
    
    let testBaseView = BaseTranslateViewController()
    
    func testAlertEmptyClipboard() {
        let testController = testBaseView.getAlertForEmptyClipboard()
        
        XCTAssertTrue(testController.title == "Clipboard")
        XCTAssertTrue(testController.message == "Currently, there is nothing copied on the devices clipboard.")
        
        let actions = testController.actions
        
        if actions.count == 1 {
            let action = actions[0]
            XCTAssertTrue(action.title == "Okay")
            XCTAssertTrue(action.style == .Default)
        }
        else{
            XCTFail("Alert controller not configured as expected if clipboard is empty")
        }
    }
    
    
}
