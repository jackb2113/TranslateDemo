//
//  ParserTests.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/8/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import XCTest

@testable import TranslateDemo

class ParserTests: XCTestCase {
    
    let parser = TranslateParseUtility()
    let notificationKeys = TranslateNotificationKeys()
    let jsonKeys = TranslateParseUtility.TranslateParserKeys()
    
    func testParserFirstResult() {
        let translatedArray = [[jsonKeys.kKeyTranslatedText : "item 1"], [jsonKeys.kKeyTranslatedText : "item 2"], [jsonKeys.kKeyTranslatedText : "item 3"], [jsonKeys.kKeyTranslations : "item 4"]]
        let dictionary = getTestDictionaryValidForTranslations(translatedArray)
        
        let result = parser.getFirstTranslateString(dictionary)
        
        XCTAssertTrue(result == "item 1")
    }
    
    func testParserMultipleTranslations() {
        
        let translatedArray = [[jsonKeys.kKeyTranslatedText : "item 1"], [jsonKeys.kKeyTranslatedText : "item 2"], [jsonKeys.kKeyTranslatedText : "item 3"], [jsonKeys.kKeyTranslations : "item 4"]]
        let dictionary = getTestDictionaryValidForTranslations(translatedArray)
        
        let result = parser.getAllTranslateStrings(dictionary)
        
        var item1 = false
        var item2 = false
        var item3 = false
        var item4 = false
        
        //assumes ordering is same, sorting may be useful
        for item in result {
            
            switch item {
            case "item 1":
                item1 = true;
                break;
            case "item 2":
                item2 = true;
                break;
            case "item 3":
                item3 = true;
                break;
            case "item 4":
                item4 = true;
                break;
            default:
                NSLog("unknown error")
            }
        }
        
        XCTAssertTrue(item1)
        XCTAssertTrue(item2)
        XCTAssertTrue(item3)
        XCTAssertFalse(item4)
    }
    
    func getTestDictionaryValidForTranslations(translatedArray: [[String : String]]) -> [String : AnyObject] {
        
        let translations = [ jsonKeys.kKeyTranslations : translatedArray ]
        
        return [jsonKeys.kKeyData : translations]
    }
}
