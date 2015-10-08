//
//  SpanishViewControllerTests.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/8/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import XCTest

@testable import TranslateDemo

class SpanishViewControllerTests: XCTestCase {
    
    func testUpdateTextSpanishInvalid() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        if let testSpanishView = mainStoryboard.instantiateViewControllerWithIdentifier("SpanishViewController")  as? SpanishViewController{
            
            testSpanishView.loadView()
            let initialText = testSpanishView.targetTextField.text
            
            let notification = NSNotification(name: "not relevant", object: nil)
            testSpanishView.updateText(notification)
            
            XCTAssertTrue(initialText == testSpanishView.targetTextField.text)
        }
    }
    
    func testUpdateTextSpanishInvalid2() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let notificationKeys = TranslateNotificationKeys()
        
        if let testSpanishView = mainStoryboard.instantiateViewControllerWithIdentifier("SpanishViewController")  as? SpanishViewController{
            
            testSpanishView.loadView()
            let initialText = testSpanishView.targetTextField.text
            
            let notification = NSNotification(name: "not relevant", object: nil, userInfo: [notificationKeys.kNotificationTranslatedText : "transalted text test"])
            testSpanishView.updateText(notification)
            
            XCTAssertTrue(initialText == testSpanishView.targetTextField.text)
        }
    }
    
    func testUpdateTextSpanishValid() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let notificationKeys = TranslateNotificationKeys()
        let jsonKeys = TranslateParseUtility.TranslateParserKeys()
        
        if let testSpanishView = mainStoryboard.instantiateViewControllerWithIdentifier("SpanishViewController")  as? SpanishViewController{
            
            testSpanishView.loadView()
            
            let translations = [ jsonKeys.kKeyTranslations : [[jsonKeys.kKeyTranslatedText : "translated text test"]] ]
            let userInfo = [notificationKeys.kNotificationTranslatedText : [jsonKeys.kKeyData : translations]]
            
            let notification = NSNotification(name: notificationKeys.kNotificationTranslatedText, object: nil, userInfo: userInfo)
            testSpanishView.updateText(notification)
            
            XCTAssertTrue(testSpanishView.targetTextField.text == "translated text test")
        }
    }
}
