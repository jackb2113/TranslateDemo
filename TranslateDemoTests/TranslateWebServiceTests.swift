//
//  TranslateWebServiceTests.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/5/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import XCTest
import Foundation

@testable import TranslateDemo

class TranslateWebServiceTests: XCTestCase {
    private let testService = TranslateWebService()
    
    func testParams() {
        
        let testText = "hello world"
        let params = testService.getParamsForTranslateWithText(testText, targetLanguage: testService.jsonKeys.kKeySpanish, sourceLanguage: testService.jsonKeys.kKeyEnglish)
        
        if let
            key = params[testService.jsonKeys.kKey] as? String,
            text = params[testService.jsonKeys.kKeySourceText] as? String,
            sourceLang = params[testService.jsonKeys.kKeySource] as? String,
            targetLang = params[testService.jsonKeys.kKeyTarget] as? String {
                
                XCTAssertTrue(targetLang == "es", "Target language parameter did not set correctly")
                XCTAssertTrue(sourceLang == "en", "Source language parameter did not set correctly")
                XCTAssertTrue(text == testText, "Text parameter did not set correctly")

                XCTAssertNotNil(key, "key should not be nil, check the API key")
                
        }
        else {
            XCTFail("one or more of the parameters bindings failed. Check TranlsateWebService : getParamsForTranslateWithText")
        }
    }
    
    func testTranslateService() {
        
        let testText = "hello world"
        
        testService.translateToSpanish(testText)
    }
}